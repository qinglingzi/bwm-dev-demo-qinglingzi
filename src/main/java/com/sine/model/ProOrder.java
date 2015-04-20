package com.sine.model;

import java.util.ArrayList;
import java.util.List;

/**
 * 订单
 * 
 * @author lscm
 *
 */
public class ProOrder {

  private Long addressId;
  private String userRemark;
  private Double payPrice;
  private Double goodsPrice;
  private Double favorablePrice;
  private Double totalFee;
  private Double favorableFee;
  private Integer feeType;
  private String remoteIp;
  private String channel;
  private UserInfo user;
  private List<ProOrderInfo> orderList = new ArrayList<ProOrderInfo>();

  public ProOrder() {
    // TODO Auto-generated constructor stub
  }

  public Long getAddressId() {
    return addressId;
  }

  public void setAddressId(Long addressId) {
    this.addressId = addressId;
  }

  public String getUserRemark() {
    return userRemark;
  }

  public void setUserRemark(String userRemark) {
    this.userRemark = userRemark;
  }

  public Double getPayPrice() {
    return payPrice;
  }

  public void setPayPrice(Double payPrice) {
    this.payPrice = payPrice;
  }

  public Double getGoodsPrice() {
    return goodsPrice;
  }

  public void setGoodsPrice(Double goodsPrice) {
    this.goodsPrice = goodsPrice;
  }

  public Double getFavorablePrice() {
    return favorablePrice;
  }

  public void setFavorablePrice(Double favorablePrice) {
    this.favorablePrice = favorablePrice;
  }

  public Double getTotalFee() {
    return totalFee;
  }

  public void setTotalFee(Double totalFee) {
    this.totalFee = totalFee;
  }

  public Double getFavorableFee() {
    return favorableFee;
  }

  public void setFavorableFee(Double favorableFee) {
    this.favorableFee = favorableFee;
  }

  public Integer getFeeType() {
    return feeType;
  }

  public void setFeeType(Integer feeType) {
    this.feeType = feeType;
  }

  public String getRemoteIp() {
    return remoteIp;
  }

  public void setRemoteIp(String remoteIp) {
    this.remoteIp = remoteIp;
  }

  public String getChannel() {
    return channel;
  }

  public void setChannel(String channel) {
    this.channel = channel;
  }

  public UserInfo getUser() {
    return user;
  }

  public void setUser(UserInfo user) {
    this.user = user;
  }

  public List<ProOrderInfo> getOrderList() {
    return orderList;
  }

  public void setOrderList(List<ProOrderInfo> orderList) {
    this.orderList = orderList;
  }



}
