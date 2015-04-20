package com.sine.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class HttpClientPoolUtil {

  private static Logger logger = LoggerFactory.getLogger(HttpClientPoolUtil.class); // 日志记录
  
  private static  List<HttpClientPool> pool = new ArrayList<HttpClientPool>();

  /**
   * 获取 client
   * 
   * @param pool
   * @param email
   * @return
   */
  public static CloseableHttpClient getClient(String email) {
    // 判断是否已经存在当前email的链接
    for (HttpClientPool httpClientPool : pool) {
      if (httpClientPool.getEmail().equals(email)) {
        return httpClientPool.getClient();
      }
    }
    return createClient(email);
  }

  /**
   * 获取 HttpClientPool
   * 
   * @param pool
   * @param email
   * @return
   */
  public static HttpClientPool getHttpClientPool(String email) {
    if (StringUtils.isBlank(email)) {
      return null;
    }
    for (HttpClientPool httpClientPool : pool) {
      if (httpClientPool.getEmail().equals(email)) {
        return httpClientPool;
      }
    }
    return null;
  }

  /**
   * 创建 client
   * 
   * @param pool
   * @param email
   * @return
   */
  public static CloseableHttpClient createClient(String email) {
    CloseableHttpClient httpclient = HttpClients.createDefault();
    HttpClientPool clientPool = new HttpClientPool(httpclient, email);
    pool.add(clientPool);
    return httpclient;
  }

  public static void destroyClient(String email) throws IOException {
    if (StringUtils.isNotBlank(email)) {
      // 判断是否已经存在当前email的链接
      HttpClientPool httpClientPool = getHttpClientPool(email);
      if (httpClientPool != null) {
        pool.remove(httpClientPool);
        httpClientPool.getClient().close();
      }
    }
    logger.debug(">>>>>>>>>"
        + ">>>>>>>>" + pool.size());
  }

}
