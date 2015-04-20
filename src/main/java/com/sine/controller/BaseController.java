package com.sine.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import com.sine.utils.HttpClientPoolUtil;
import com.sine.utils.HttpRequestUtils;

public class BaseController {
  private static Logger logger = LoggerFactory.getLogger(BaseController.class); // 日志记录
  
  @Value("#{settings['ucenterOnline']}")
  private String ucenter;

  /**
   * 获取当前用户的client
   * 
   * @param request
   * @return
   */
  public CloseableHttpClient getHttpClient(HttpServletRequest request) {
    HttpSession session = request.getSession();
    Object emailO = session.getAttribute("_email");
    if (emailO != null) {
      String email = (String) emailO;
      CloseableHttpClient httpclient = HttpClientPoolUtil.getClient(email);
      return httpclient;
    }else{
      CloseableHttpClient httpclient = HttpClients.createDefault();
      return httpclient;
    }
  }
  
  public Map getUserInfo(HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException{
    String json =
        HttpRequestUtils.httpGetBase(getHttpClient(request), ucenter+ "/user/user/data/info.htm?isSimple=2", null);
    ObjectMapper mapper = new ObjectMapper();
    Map userInfo = mapper.readValue(json, Map.class);
    return userInfo;
  }

}
