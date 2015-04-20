package com.sine.controller.order;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sine.controller.BaseController;
import com.sine.model.ProInfo;
import com.sine.model.ProOrder;
import com.sine.model.ProOrderInfo;
import com.sine.model.ProductDto;
import com.sine.model.ProductInfo;
import com.sine.model.ProductItem;
import com.sine.model.ProductSku;
import com.sine.model.UserInfo;
import com.sine.utils.DoubleMathUtils;
import com.sine.utils.HttpRequestUtils;
import com.sine.utils.Message;


@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {
  private static Logger logger = LoggerFactory.getLogger(OrderController.class); // 日志记录

  @Value("#{settings['ucenterOnline']}")
  private String ucenter;

  @Value("#{settings['searchOnline']}")
  private String search;

  @Value("#{settings['orderTest']}")
  private String orderUrl;


  /**
   * 我的订单页
   * 
   * @param model
   * @param request
   * @return
   * @throws JsonParseException
   * @throws JsonMappingException
   * @throws IOException
   */
  @RequestMapping(value = "/myOrder")
  public void myOrder(Model model,String search, HttpServletRequest request) throws JsonParseException,
  JsonMappingException, IOException {
    CloseableHttpClient client = getHttpClient(request);
    model.addAttribute("userInfo", getUserInfo(request));
    Map<String, Object> params = new HashMap<String, Object>();
    HttpSession session = request.getSession();
    params.put("userId",session.getAttribute("_userId"));
    params.put("deepth",3);
    params.put("pageSize",2);
    if(StringUtils.isNotBlank(search)){
      params.put("search",search);
    }
    String json = HttpRequestUtils.httpGetBase(client, orderUrl+"/order/group/page.htm", params);
    ObjectMapper mapper = new ObjectMapper();
    Map result = mapper.readValue(json, Map.class);
    model.addAttribute("result", result);
    logger.debug(">>>>>>>>>>>>>>>>>>>  result:>>>>>>>>>>>>>>>>>>>"+ result);
  }
  
  /**
   * 订单取消
   * @param model
   * @param groupId
   * @param request
   * @return
   * @throws JsonParseException
   * @throws JsonMappingException
   * @throws IOException
   */
  @RequestMapping(value = "/cancel")
  @ResponseBody
  public Message cancel(Model model,String groupId, HttpServletRequest request) throws JsonParseException,
      JsonMappingException, IOException {
    CloseableHttpClient client = getHttpClient(request);
    model.addAttribute("userInfo", client);
    Map<String, Object> params = new HashMap<String, Object>();
    HttpSession session = request.getSession();
    params.put("userId",session.getAttribute("_userId"));
    params.put("groupId",groupId);
    params.put("reason","不想买了");
    Message message = HttpRequestUtils.httpGet(client, orderUrl+"/order/group/cancel.htm", params);
    return message;
  }

  /**
   * 订单页面
   * 
   * @param model
   * @param request
   * @return
   * @throws JsonParseException
   * @throws JsonMappingException
   * @throws IOException
   */
  @RequestMapping(value = "/buyNow", method = RequestMethod.GET)
  public String buyNowGet(Model model, HttpServletRequest request) throws JsonParseException,
      JsonMappingException, IOException {
    HttpSession session = request.getSession();
    String tid = (String) session.getAttribute("tid");
    String orderNo = (String) session.getAttribute("orderNo");
    if (StringUtils.isBlank(tid)) {
      // 缺少参数，页面跳转
      return "redirect:/index.htm";
    }
    return buyNowPost(model, tid, orderNo, request);
  }

  /**
   * 订单页面
   * 
   * @param model
   * @param tid
   * @param orderNoSession
   * @param request
   * @return
   * @throws JsonParseException
   * @throws JsonMappingException
   * @throws IOException
   */
  @RequestMapping(value = "/buyNow", method = RequestMethod.POST)
  public String buyNowPost(Model model, String tid, String orderNoSession,
      HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
    HttpSession session = request.getSession();
    if (StringUtils.isBlank(tid)) {
      // 缺少参数，页面跳转
      return "redirect:/index.htm";
    }
    String userId = session.getAttribute("_userId").toString();
    String email = session.getAttribute("_email").toString();
    session.setAttribute("tid", tid);
    CloseableHttpClient client = getHttpClient(request);
    ObjectMapper mapper = new ObjectMapper();
    String orderNo = null;
    // session内没有信息
    if (StringUtils.isBlank(orderNoSession)) {
      orderNo = getOrderNo(client);
      session.setAttribute("orderNo", orderNo);
    } else {
      orderNo = orderNoSession;
    }
    // 数量固定为1
    int buyNum = 1;
    String str = getProItem(tid, client);
    // 数据为空
    if (str == null) {
      // 跳转页面
      return "redirect:/index.htm";
    }
    logger.debug(">>>>>>>>>>>>>>>>>>>  _email:>>>>>>>>>>>>>>>>>>>"
        + request.getSession().getAttribute("_email"));
    logger.debug(">>>>>>>>>>>>>>>>>>>  _userId:>>>>>>>>>>>>>>>>>>>"
        + request.getSession().getAttribute("_userId"));
    // 获取地址
    String addrJson = getAddress(userId, client);
    addrJson = getAddress(userId, client);
    Map address = mapper.readValue(addrJson, Map.class);
    logger.debug(">>>>>>>>>>>>>>>>>>>  address:>>>>>>>>>>>>>>>>>>>" + address);
    ProductInfo pro = mapper.readValue(str, ProductInfo.class);
    logger.debug(">>>>>>>>>>>>>>>>>>>  pro:>>>>>>>>>>>>>>>>>>>" + str);
    // 组装订单信息
    ProOrder order = getOrder(pro, buyNum, userId, email, orderNo);
    session.setAttribute("order", order);

    model.addAttribute("result", pro);
    model.addAttribute("addressMap", address);
    model.addAttribute("buyNum", buyNum);
    model.addAttribute("order", order);
    model.addAttribute("userInfo", getUserInfo(request));
    return "order/buyNow";
  }

  /**
   * 组装订单
   * @param pro
   * @param buyNum
   * @param userId
   * @param email
   * @param orderNo
   * @return
   */
  public ProOrder getOrder(ProductInfo pro, Integer buyNum, String userId, String email,
      String orderNo) {
    // 组装订单信息
    ProOrder order = new ProOrder();
    ProductDto product = pro.getVal().getProductDto();
    ProductItem item = pro.getVal().getItems().get(0);
    List<ProductSku> skuList = pro.getVal().getSkuModel();
    ProductSku sku = null;
    if (CollectionUtils.isNotEmpty(skuList)) {
      sku = pro.getVal().getSkuModel().get(0);
    }
    Double allPrice = item.getPrice() * buyNum;
    order.setPayPrice(allPrice);
    order.setGoodsPrice(allPrice);
    order.setFavorablePrice(0d);
    order.setTotalFee(0d);
    order.setFavorableFee(10d);
    order.setFeeType(0);
    order.setChannel("dg");

    UserInfo user = new UserInfo();
    user.setUserId(userId);
    user.setEmail(email);

    order.setUser(user);

    ProOrderInfo proOrderInfo = new ProOrderInfo();
    proOrderInfo.setOrderNum(orderNo);
    proOrderInfo.setGoodsSumPrice(allPrice);
    proOrderInfo.setType(0);
    proOrderInfo.setFee(0d);
    proOrderInfo.setFavorablePrice(10d);

    ProInfo proInfo = new ProInfo();
    proInfo.setOrderNum(orderNo + "_s1");
    proInfo.setGoodsName(product.getTitle());
    proInfo.setGoodsImgUrl(product.getImg());
    proInfo.setGoodsUrl(product.getItemUrl());
    proInfo.setGoodsSource("HF");
    // proInfo.setResourceCode(resourceCode);
    proInfo.setGoodsPrice(item.getPrice());
    proInfo.setGoodsPriceAvg(item.getMidPrice());
    proInfo.setPostage(0d);
    proInfo.setDocId(product.getId());
    proInfo.setGoodsSpec(item.getItemContent());
    proInfo.setGoodsNum(buyNum);
    proInfo.setB5mSource("search");
    proInfo.setChannel("HF");
    proInfo.setChannelFavorablePrice(DoubleMathUtils.sub(item.getHighPrice(), item.getPrice()));
    if (sku != null)
      proInfo.setSkuId(sku.getId());
    proInfo.setOutsideLink(product.getOuterUrl());
    // proInfo.setGoodsOriginImgUrl();

    proOrderInfo.getGoodsList().add(proInfo);
    order.getOrderList().add(proOrderInfo);
    return order;
  }

  @RequestMapping(value = "/toOrder", method = RequestMethod.POST)
  @ResponseBody
  public Message toOrder(Model model, Long addressId, Integer buyNum, HttpServletRequest request)
      throws JsonParseException, JsonMappingException, IOException, IllegalAccessException,
      InvocationTargetException, NoSuchMethodException {
    HttpSession session = request.getSession();
    String orderNo = (String) session.getAttribute("orderNo");
    String tid = (String) session.getAttribute("tid");
    if (StringUtils.isBlank(orderNo) || StringUtils.isBlank(tid)|| addressId==null ) {
      // 缺少参数
      return new Message(-1, false, "缺少参数[orderNo、tid、addressId]");
      // return "/index.htm";
    }
    if (buyNum == null) {
      buyNum = 1;
    }
    String userId = session.getAttribute("_userId").toString();
    String email = session.getAttribute("_email").toString();

    CloseableHttpClient client = getHttpClient(request);
    String str = getProItem(tid, client);
    // 数据为空
    if (str == null) {
      // 跳转页面
      return new Message(-1, false, "缺少参数");
    }
    ObjectMapper mapper = new ObjectMapper();
    ProductInfo pro = mapper.readValue(str, ProductInfo.class);
    ProOrder order = getOrder(pro, buyNum, userId, email, orderNo);
    order.setAddressId(addressId);
    Message message = saveOrder(order, getHttpClient(request));
    return message;
  }


  /**
   * 保存订单
   * 
   * @throws NoSuchMethodException
   * @throws InvocationTargetException
   * @throws IllegalAccessException
   * @throws IOException
   * @throws JsonMappingException
   * @throws JsonGenerationException
   * 
   */
  private Message saveOrder(ProOrder order, CloseableHttpClient httpclient)
      throws IllegalAccessException, InvocationTargetException, NoSuchMethodException,
      JsonGenerationException, JsonMappingException, IOException {
    ObjectMapper mapper = new ObjectMapper();
    String json = mapper.writeValueAsString(order);
    logger.debug(">>>>>>>>>>>>>>>>>>>>json>>>>>>>>>>>>>>>>>>>>" + json);
    Message message = new Message();
    // HttpRequestUtils.httpPost(httpclient, orderUrl + "/order/group/save.htm", map);

    String str = doPost(httpclient, orderUrl + "/order/group/save.htm", json);
    logger.debug(">>>>>>>>>>>>>>>>>>>>str>>>>>>>>>>>>>>>>>>>>" + str);
    return mapper.readValue(str, Message.class);
  }

  public static String doPost(CloseableHttpClient httpclient,String url,String json){
    HttpPost post = new HttpPost(url);
    String response = null;
    try {
      StringEntity s = new StringEntity(json.toString(),"UTF-8");
      s.setContentEncoding("UTF-8");
      s.setContentType("application/json");//发送json数据需要设置contentType
      post.setEntity(s);
      HttpResponse res = httpclient.execute(post);
      if(res.getStatusLine().getStatusCode() == HttpStatus.SC_OK){
        HttpEntity entity = res.getEntity();
        String result = EntityUtils.toString(res.getEntity());// 返回json格式：
        response = result;
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    return response;
  }


  /**
   * 获取产品
   * 
   * @return
   * @throws IOException
   * @throws JsonMappingException
   * @throws JsonParseException
   */
  private String getProItem(String tId, CloseableHttpClient httpclient) throws JsonParseException,
      JsonMappingException, IOException {
    Map<String, Object> params = new HashMap<String, Object>();
    params.put("id", tId.toString());
    params.put("isGetItem", true);
    params.put("isGetSku", true);
    String str =
        HttpRequestUtils.httpGetBase(httpclient, search
            + "/productAPI/product/get.htm?authCode=172ca9138968b5f3dd28a3d944f51caa", params);
    ObjectMapper mapper = new ObjectMapper();
    // Map map = mapper.readValue(str, Map.class);
    return str;
  }

  /**
   * 获取订单号
   * 
   * @param tId
   * @param httpclient
   * @return
   * @throws JsonParseException
   * @throws JsonMappingException
   * @throws IOException
   */
  private String getOrderNo(CloseableHttpClient httpclient) throws JsonParseException,
      JsonMappingException, IOException {
    Map<String, Object> params = new HashMap<String, Object>();
    params.put("source", "DG");
    String orderNo = null;
    String str =
        HttpRequestUtils.httpGetBase(httpclient, orderUrl + "/order/resource/generate_id.htm?1=1",
            params);
    ObjectMapper mapper = new ObjectMapper();
    if (str != null) {
      Map map = mapper.readValue(str, Map.class);
      orderNo = (String) map.get("data");
    } else {
      orderNo = getOrderNo(httpclient);
    }
    return orderNo;
  }


  /**
   * 获取地址
   * 
   * @param tId
   * @param httpclient
   * @return
   * @throws IOException
   */
  private String getAddress(String userId, CloseableHttpClient httpclient) throws IOException {
    Map<String, Object> params = new HashMap<String, Object>();
    params.put("userId", userId);
    String str =
        HttpRequestUtils.httpPostBase(httpclient, ucenter + "/user/address/data/find.htm", params);
    if (str == null) {
      str = getOrderNo(httpclient);
    }
    return str;

  }
}
