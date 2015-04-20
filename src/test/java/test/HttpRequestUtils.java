package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.HashMap;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpRequestUtils {
  private static Logger logger = LoggerFactory.getLogger(HttpRequestUtils.class); // 日志记录

  public static void main(String[] args) throws IOException {
    String s= "http://order.stage.b5m.com/dh/order/group/save.htm";
    URL url = new URL(s);
    HttpURLConnection http = (HttpURLConnection) url.openConnection();
    http.setDoOutput(true);  
    http.setDoInput(true);  
    http.setRequestMethod("POST");  
    http.connect();  
    OutputStreamWriter out = new OutputStreamWriter(http.getOutputStream(), "UTF-8"); 
    
    String input = "data=[{\"Nianji\":\"高中2015届\",\"Banji\":\"元培书院\",\"Xuehao\":\"1525998\",\"Xingming\":\"姓名\",\"JianhurenShouji\":\"11111111111\",\"QingjiaLeixing\":\"病假\",\"KaishiShijian\":\"2014-05-24T00:00:00\",\"KaishiJie\":\"第1节\",\"JieshuShijian\":\"2014-05-24T00:00:00\",\"JieshuJie\":\"第1节\",\"QingjiaYuanyin\":\"原因\",\"key\":\"\",\"pagesize\":5}]"; 
     
    out.append(input);  
    out.flush();  
    out.close(); 
    
    
    BufferedReader reader = new BufferedReader(new InputStreamReader(http.getInputStream()));
    String line;
    StringBuffer buffer = new StringBuffer();
    while ((line = reader.readLine()) != null) {
        buffer.append(line);
    }
    reader.close();
    http.disconnect();
    System.out.println(buffer.toString());
  }

  /**
   * httpPost
   * 
   * @param url
   * @param jsonParam
   * @return
   */
  public static String httpPost(String url, Object jsonParam) {
    return httpPost(url, jsonParam, false);
  }
  
  /**
   * httpPost
   * 
   * @param url
   * @param params
   * @return
   */
  public static String httpPost(String url, HashMap<String, Object> params) {
    ObjectMapper objectMapper = new ObjectMapper();
    String jsonParam = null;
    try {
      jsonParam = objectMapper.writeValueAsString(params);
    } catch (JsonGenerationException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (JsonMappingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return httpPost(url, jsonParam, false);
  }

  /**
   * httpPost
   * 
   * @param url
   * @param jsonParam
   * @param noNeedResponse
   * @return
   */
  public static String httpPost(String url, Object jsonParam, boolean noNeedResponse) {
    // post请求返回结果
    CloseableHttpClient httpclient = HttpClients.createDefault();
    HttpPost method = new HttpPost(url);
    String json = null;
    try {
      if (null != jsonParam) {
        // 解决中文乱码问题
        StringEntity entity = new StringEntity(jsonParam.toString(), "utf-8");
        entity.setContentEncoding("UTF-8");
        entity.setContentType("application/json");
        method.setEntity(entity);
      }
      HttpResponse result = httpclient.execute(method);
      url = URLDecoder.decode(url, "UTF-8");
      /** 请求发送成功，并得到响应 **/
      if (result.getStatusLine().getStatusCode() == 200) {
        String str = "";
        try {
          /** 读取服务器返回过来的json字符串数据 **/
          str = EntityUtils.toString(result.getEntity());
          if (noNeedResponse) {
            return null;
          }
          /** 把json字符串转换**/
          ObjectMapper objectMapper = new ObjectMapper();
          json = objectMapper.writeValueAsString(str);
          logger.debug("post结果:" + json);
        } catch (Exception e) {
          logger.error("post请求提交失败:" + url, e);
        }
      }
    } catch (IOException e) {
      logger.error("post请求提交失败:" + url, e);
    }
    return json;
  }

  /**
   * httpGet
   * 
   * @param url
   * @return
   */
  public static String httpGet(String url) {
    // get请求返回结果
    // JSONObject jsonResult = null;
    String strResult = null;
    try {
      CloseableHttpClient httpclient = HttpClients.createDefault();
      // 发送get请求
      HttpGet request = new HttpGet(url);
      HttpResponse response = httpclient.execute(request);
      /** 请求发送成功，并得到响应 **/
      if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
        /** 读取服务器返回过来的json字符串数据 **/
        strResult = EntityUtils.toString(response.getEntity());
        logger.debug("请求结果:" + strResult);
        /** 把json字符串转换成json对象 **/
        // jsonResult = JSONObject.fromObject(strResult);
        url = URLDecoder.decode(url, "UTF-8");
      } else {
        logger.error("get请求提交失败:" + url);
      }
    } catch (IOException e) {
      logger.error("get请求提交失败:" + url, e);
    }
    return strResult;
  }
}
