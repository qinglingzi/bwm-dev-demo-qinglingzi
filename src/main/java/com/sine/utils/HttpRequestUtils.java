package com.sine.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpRequestUtils {
  private static Logger logger = LoggerFactory.getLogger(HttpRequestUtils.class); // 日志记录

  public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {
    CloseableHttpClient httpclient = HttpClients.createDefault();
    changePwd(httpclient);
  }
  
  public static void changePwd(CloseableHttpClient httpclient) throws JsonParseException, JsonMappingException, IOException{
    login(httpclient);
    Map<String, Object> params = new HashMap<String, Object>();
    params.put("password","17c82cbc922e858b30a6cf3332cdede5");
    params.put("newPassword","17c82cbc922e858b30a6cf3332cdede5");
    String message = HttpRequestUtils.httpPostBase(httpclient, "http://ucenter.b5m.com/user/info/data/editPwd.htm", params);
    logger.debug(">>>>>>>>>>>>>>>>>>>  result:>>>>>>>>>>>>>>>>>>>"+ message);
  }
  
  public static void checkEmail(CloseableHttpClient httpclient) throws JsonParseException, JsonMappingException, IOException{
    Message message = HttpRequestUtils.httpPost(httpclient, "http://ucenter.b5m.com/user/info/data/isNameOrEmailUse.do?email=qinglingzi@b5m.com", null);
    logger.debug(">>>>>>>>>>>>>>>>>>>  result:>>>>>>>>>>>>>>>>>>>"+ message);
  }
  
  public static void cancelOrder(CloseableHttpClient httpclient) throws JsonParseException, JsonMappingException, IOException{
    login(httpclient);
    Map<String, Object> params = new HashMap<String, Object>();
    params.put("userId","d67af426758048ba84d3a089010df964");
    params.put("groupId","6475004488455578758");
    params.put("reason","不想买了");
    Message message = HttpRequestUtils.httpPost(httpclient, "http://order.b5m.com/dh/order/group/cancel.htm", params);
    logger.debug(">>>>>>>>>>>>>>>>>>>  result:>>>>>>>>>>>>>>>>>>>"+ message);
  }
  
  public static void getOrderPage(CloseableHttpClient httpclient) throws JsonParseException, JsonMappingException, IOException{
    Map<String, Object> params = new HashMap<String, Object>();
//  params.put("userId","fd8643d9e7b04e9e941326258a19ff92");
  params.put("userId","d67af426758048ba84d3a089010df964");
  String json = HttpRequestUtils.httpPostBase(httpclient,"http://order.b5m.com/dh/order/group/page.htm", params);
  ObjectMapper mapper = new ObjectMapper();
  Map result = mapper.readValue(json, Map.class);
  logger.debug(">>>>>>>>>>>>>>>>>>>  result:>>>>>>>>>>>>>>>>>>>"+ result);
  }
  
  public static void addAddress(CloseableHttpClient httpclient) {
    HashMap<String, Object> params = new HashMap<String, Object>();
    params.put("userId", "fd8643d9e7b04e9e941326258a19ff92");
    params.put("cityId", 210200);
    params.put("cityName", "大连市");
    params.put("detailAddress", "青灵子2青灵子2青灵子2青灵子2");
    params.put("districtId", 210203);
    params.put("districtName", "西岗区");
    params.put("mobile", "13818764292");
    params.put("provinceId", 210000);
    params.put("provinceName", "辽宁省");
    params.put("userName", "青灵子2");
    // Message message =
    // httpPost("http://ucenter.b5m.com/user/info/data/baseUpdate.htm?jsonpCallback=", params);
    String json =
        httpPostBase(httpclient, "http://ucenter.stage.bang5mai.com/user/address/data/save.htm",
            params);
    System.out.println(json);
  }

  public static void login(CloseableHttpClient httpclient) {
    HashMap<String, Object> params = new HashMap<String, Object>();
    params.put("email", "qinglingzi@b5m.com");
    params.put("password", "17c82cbc922e858b30a6cf3332cdede5");
    Message message =httpGet(httpclient, "http://ucenter.b5m.com/user/user/data/login2.htm?jsonpCallback=",
            params);
    System.out.println(message);
  }
  
  public static void getInfo(CloseableHttpClient httpclient) throws JsonParseException, JsonMappingException, IOException {
    HashMap<String, Object> params = new HashMap<String, Object>();
    params.put("email", "qinglingzi@b5m.com");
    params.put("password", "17c82cbc922e858b30a6cf3332cdede5");
    String json =httpGetBase(httpclient,"http://ucenter.stage.bang5mai.com/user/user/data/info.htm?isSimple=2",null);
    ObjectMapper mapper = new ObjectMapper();
    Map result = mapper.readValue(json, Map.class);
    System.out.println(result);
  }

  public static void update(CloseableHttpClient httpclient) {
    HashMap<String, Object> params = new HashMap<String, Object>();
    params.put("brithdayStr", "2013-10-1");
    params.put("city", "1");
    params.put("constellation", "天秤");
    params.put("currentResidence", "45-1");
    params.put("day", "1");
    params.put("email", "qinglingzi@b5m.com");
    params.put("gender", "male");
    params.put("hometown", "null");
    params.put("mobile", "");
    params.put("month", 10);
    params.put("nickName", "BMW-青灵子11212");
    params.put("province", "45");
    params.put("realName", "");
    params.put("year", "2013");
    // Message message =
    // httpPost("http://ucenter.b5m.com/user/info/data/baseUpdate.htm?jsonpCallback=", params);
    Message message =
        httpGet(httpclient, "http://ucenter.b5m.com/user/info/data/baseUpdate.htm?jsonpCallback=",
            params);
    System.out.println(message);
  }

  public static Message httpGet(CloseableHttpClient httpclient, String url, Map<String, Object> map) {
    Message message = new Message();
    ObjectMapper mapper = new ObjectMapper();
    String strResult = httpGetBase(httpclient, url, map);
    try {
      message = mapper.readValue(strResult, Message.class);
    } catch (JsonParseException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (JsonMappingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return message;
  }
  
  /**
   * httpGet
   * 
   * @param url
   * @return
   */
  public static String httpGetBase(CloseableHttpClient httpclient, String url,
      Map<String, Object> map) {
    // 组装请求
    url = createUrl(url, map);
    logger.debug("url>>>>>>>>>"+url);
    // get请求返回结果
    String strResult = null;
    try {
      // CloseableHttpClient httpclient = getClient();
      // 发送get请求
      HttpGet request = new HttpGet(url);
      HttpResponse response = httpclient.execute(request);
      /** 请求发送成功，并得到响应 **/
      if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
        strResult = EntityUtils.toString(response.getEntity());
        logger.debug("请求结果:" + strResult);
        /** 把json字符串转换成json对象 **/
        url = URLDecoder.decode(url, "UTF-8");
      } else {
        logger.error("get请求提交失败:" + url);
      }
    } catch (IOException e) {
      logger.error("get请求提交失败:" + url, e);
    }
    return strResult;
  }
  
  
  public static Message httpPost(CloseableHttpClient httpclient, String url, Map<String, Object> map) {
    Message message = new Message();
    ObjectMapper mapper = new ObjectMapper();
    String strResult = httpPostBase(httpclient, url, map);
    try {
      message = mapper.readValue(strResult, Message.class);
    } catch (JsonParseException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (JsonMappingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return message;
  }
  
  /**
   * httpPost
   * 
   * @param url
   * @param params
   * @return
   */
  public static String httpPostBase(CloseableHttpClient httpclient,String url, Map<String, Object> map) {
    return httpPostBase(httpclient,url,map, false);
  }
  
  /**
   * httpPost
   * 
   * @param url
   * @param jsonParam
   * @param noNeedResponse
   * @return
   */
  public static String httpPostBase(CloseableHttpClient httpclient,String url, Map<String, Object> map, boolean noNeedResponse) {
    // post请求返回结果
    HttpPost httpost = new HttpPost(url);
    String str = null;
    try {
      if (null != map) {
        //设置表单提交编码为UTF-8
        httpost.setEntity(new UrlEncodedFormEntity(createParams(map), HTTP.UTF_8));
      }
      HttpResponse result = httpclient.execute(httpost);
      url = URLDecoder.decode(url, "UTF-8");
      /** 请求发送成功，并得到响应 **/
      if (result.getStatusLine().getStatusCode() == 200) {
        try {
          /** 读取服务器返回过来的json字符串数据 **/
          str = EntityUtils.toString(result.getEntity(), "UTF-8");
          if (noNeedResponse) {
            return null;
          }
          logger.debug("post结果:" + str);
        } catch (Exception e) {
          logger.error("post请求提交失败:" + url, e);
        }
      }
    } catch (IOException e) {
      logger.error("post请求提交失败:" + url, e);
    }
    return str;
  }

  private static void append(StringBuffer sb, Object value, String key) {
    if (null == value) {
      return;
    }
    if (sb.length() > 0) {
      sb.append("&");
    }
    try {
      sb.append(key + "=" + URLEncoder.encode(value.toString(), "UTF-8"));
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
  }

  /**
   * 组装url
   * @param url
   * @param map
   * @return
   */
  public static String createUrl(String url, Map<String, Object> map) {
    // 组装请求
    if (map != null) {
      StringBuffer sb = new StringBuffer();
      for (Entry<String, Object> entry : map.entrySet()) {
        append(sb, entry.getValue(), entry.getKey());
      }
      if(url.contains("?")){
        url = url + "&" + sb.toString();
      }else{
        url = url + "?" + sb.toString();
      }
      
    }
    return url;
  }
  
  public static List<NameValuePair> createParams(Map<String, Object> map) {
    
    List<NameValuePair> nvps = new ArrayList <NameValuePair>();
    // 组装请求
    if (map != null) {
      for (Entry<String, Object> entry : map.entrySet()) {
        if(entry.getValue()!=null && !entry.getValue().equals("null")){
          nvps.add(new BasicNameValuePair(entry.getKey(), entry.getValue().toString()));
        }
      }
    }
    return nvps;
  }
}
