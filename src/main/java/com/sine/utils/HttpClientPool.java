package com.sine.utils;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;


public class HttpClientPool {
  private CloseableHttpClient client;
  private String email;

  public HttpClientPool() {
    // TODO Auto-generated constructor stub
  }
  
  public HttpClientPool(CloseableHttpClient client,String email) {
    // TODO Auto-generated constructor stub
    this.client = client;
    this.email = email;
  }
  
  public CloseableHttpClient getClient(List<HttpClientPool> pool,String email) {
    if(StringUtils.isBlank(email)){
      return null;
    }
    for (HttpClientPool httpClientPool : pool) {
      if(httpClientPool.getEmail().equals(email)){
        return client;
      }
    }
    return null;
  }
  
  public CloseableHttpClient createClient(List<HttpClientPool> pool,String email) {
    if(StringUtils.isBlank(email)){
      return null;
    }
    CloseableHttpClient httpclient = HttpClients.createDefault();
    HttpClientPool clientPool = new HttpClientPool(httpclient, email);
    pool.add(clientPool);
    return httpclient;
  }
  
  public CloseableHttpClient getClient() {
    return client;
  }

  public void setClient(CloseableHttpClient client) {
    this.client = client;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


}
