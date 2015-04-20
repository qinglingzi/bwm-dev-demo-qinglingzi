package com.sine.model;

import java.util.ArrayList;
import java.util.List;

/**
 * 订单明细
 * 
 * @author lscm
 *
 */
public class ProOrderInfo {
  private String orderNum;
  private Double goodsSumPrice;
  private Integer type;
  private Double fee;
  private String bill;
  private Double favorablePrice;
  private List<ProInfo> goodsList = new ArrayList<ProInfo>();

  public ProOrderInfo() {
    // TODO Auto-generated constructor stub
  }

  public String getOrderNum() {
    return orderNum;
  }

  public void setOrderNum(String orderNum) {
    this.orderNum = orderNum;
  }

  public Double getGoodsSumPrice() {
    return goodsSumPrice;
  }

  public void setGoodsSumPrice(Double goodsSumPrice) {
    this.goodsSumPrice = goodsSumPrice;
  }

  public Integer getType() {
    return type;
  }

  public void setType(Integer type) {
    this.type = type;
  }

  public Double getFee() {
    return fee;
  }

  public void setFee(Double fee) {
    this.fee = fee;
  }

  public String getBill() {
    return bill;
  }

  public void setBill(String bill) {
    this.bill = bill;
  }

  public Double getFavorablePrice() {
    return favorablePrice;
  }

  public void setFavorablePrice(Double favorablePrice) {
    this.favorablePrice = favorablePrice;
  }

  public List<ProInfo> getGoodsList() {
    return goodsList;
  }

  public void setGoodsList(List<ProInfo> goodsList) {
    this.goodsList = goodsList;
  }

}
