package com.sine.utils;

public class Message {
  /**
   * {"code":-1,"ok":true,"data":"更新成功"}
   */
  private Integer code;
  private boolean ok;
  private Object data;
  private String message;
  private String msg;

  public Message() {
    // TODO Auto-generated constructor stub
  }

  public Message(Integer code, boolean ok, Object data) {
    // TODO Auto-generated constructor stub
    this.code = code;
    this.ok = ok;
    this.data = data;
  }

  
  @Override
  public String toString() {
    return "Message [code=" + code + ", ok=" + ok + ", data=" + data + ", message=" + message
        + ", msg=" + msg + "]";
  }

  public Integer getCode() {
    return code;
  }

  public void setCode(Integer code) {
    this.code = code;
  }

  public boolean isOk() {
    return ok;
  }

  public void setOk(boolean ok) {
    this.ok = ok;
  }

  public Object getData() {
    return data;
  }

  public void setData(Object data) {
    this.data = data;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getMsg() {
    return msg;
  }

  public void setMsg(String msg) {
    this.msg = msg;
  }
  
  


}
