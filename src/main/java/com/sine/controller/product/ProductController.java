package com.sine.controller.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.http.impl.client.CloseableHttpClient;
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

import com.sine.controller.BaseController;
import com.sine.model.ProductInfo;
import com.sine.utils.HttpRequestUtils;


@Controller
@RequestMapping("/pro")
public class ProductController extends BaseController {

  private static Logger logger = LoggerFactory.getLogger(ProductController.class); // 日志记录

  @Value("#{settings['ucenterOnline']}")
  private String ucenter;

  @Value("#{settings['searchOnline']}")
  private String search;

  /**
   * 获取单个商品信息
   * 
   * @param model
   * @throws IOException
   * @throws JsonMappingException
   * @throws JsonParseException
   */
  @RequestMapping(value = "/item", method = RequestMethod.GET)
  public String getProduct(Model model, String tid, HttpServletRequest request)
      throws JsonParseException, JsonMappingException, IOException {
    if (StringUtils.isBlank(tid)) {
      // 缺少参数，页面跳转
      return "redirect:/index.htm";
    }
    ObjectMapper mapper = new ObjectMapper();
    String json = getProItem(tid, getHttpClient(request));
    // 数据为空
    if (json == null) {
      // 跳转页面
      return "redirect:/index.htm";
    }
    ProductInfo pro = mapper.readValue(json, ProductInfo.class);
    model.addAttribute("userInfo", getUserInfo(request));
    model.addAttribute("result", pro);
    return "pro/item";
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
    return str;
  }
}
