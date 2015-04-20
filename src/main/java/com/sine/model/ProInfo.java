package com.sine.model;

/**
 * 订单明细
 * 
 * @author lscm
 *
 */
public class ProInfo {
  /**
   * "orderNum":"子订单号", "goodsName":"商品名称", "goodsImgUrl":"商品图片链接", "goodsUrl":"商品地址",
   * "goodsSource":"商品来源", "resourceCode":"商品来源编号(int)", "goodsPrice":"商品价格(float)",
   * "goodsPriceAvg":"全网均价(float)", "postage":"商品邮费(float)", "docId":"商品ID", "goodsRemark":"商品备注信息",
   * "goodsSpec":"商品规格", "goodsNum":"商品数量(int)", "b5mSource":"商品来源流量标签(用于BI统计)", "channel":"商品渠道",
   * "channelFavorablePrice":"商品渠道对应的优惠价格(float)", "skuId":"sku标识", "outsideLink":"站外链接",
   * "goodsOriginImgUrl":"商品源图片链接"
   */
  private String orderNum;
  private String goodsName;
  private String goodsImgUrl;
  private String goodsUrl;
  private String goodsSource;
  private Integer resourceCode;
  private Double goodsPrice;
  private Double goodsPriceAvg;
  private Double postage;
  private Long docId;
  private String goodsRemark;
  private String goodsSpec;
  private Integer goodsNum;
  private String b5mSource;
  private String channel;
  private Double channelFavorablePrice;
  private Long skuId;
  private String outsideLink;
  private String goodsOriginImgUrl;

  
  
  public String getGoodsSpec() {
    return goodsSpec;
  }

  public void setGoodsSpec(String goodsSpec) {
    this.goodsSpec = goodsSpec;
  }

  public ProInfo() {
    // TODO Auto-generated constructor stub
  }

  public String getOrderNum() {
    return orderNum;
  }

  public void setOrderNum(String orderNum) {
    this.orderNum = orderNum;
  }

  public String getGoodsName() {
    return goodsName;
  }

  public void setGoodsName(String goodsName) {
    this.goodsName = goodsName;
  }

  public String getGoodsImgUrl() {
    return goodsImgUrl;
  }

  public void setGoodsImgUrl(String goodsImgUrl) {
    this.goodsImgUrl = goodsImgUrl;
  }

  public String getGoodsUrl() {
    return goodsUrl;
  }

  public void setGoodsUrl(String goodsUrl) {
    this.goodsUrl = goodsUrl;
  }

  public String getGoodsSource() {
    return goodsSource;
  }

  public void setGoodsSource(String goodsSource) {
    this.goodsSource = goodsSource;
  }

  public Integer getResourceCode() {
    return resourceCode;
  }

  public void setResourceCode(Integer resourceCode) {
    this.resourceCode = resourceCode;
  }

  public Double getGoodsPrice() {
    return goodsPrice;
  }

  public void setGoodsPrice(Double goodsPrice) {
    this.goodsPrice = goodsPrice;
  }

  public Double getGoodsPriceAvg() {
    return goodsPriceAvg;
  }

  public void setGoodsPriceAvg(Double goodsPriceAvg) {
    this.goodsPriceAvg = goodsPriceAvg;
  }

  public Double getPostage() {
    return postage;
  }

  public void setPostage(Double postage) {
    this.postage = postage;
  }

  public Long getDocId() {
    return docId;
  }

  public void setDocId(Long docId) {
    this.docId = docId;
  }

  public String getGoodsRemark() {
    return goodsRemark;
  }

  public void setGoodsRemark(String goodsRemark) {
    this.goodsRemark = goodsRemark;
  }

  public Integer getGoodsNum() {
    return goodsNum;
  }

  public void setGoodsNum(Integer goodsNum) {
    this.goodsNum = goodsNum;
  }

  public String getB5mSource() {
    return b5mSource;
  }

  public void setB5mSource(String b5mSource) {
    this.b5mSource = b5mSource;
  }

  public String getChannel() {
    return channel;
  }

  public void setChannel(String channel) {
    this.channel = channel;
  }

  public Double getChannelFavorablePrice() {
    return channelFavorablePrice;
  }

  public void setChannelFavorablePrice(Double channelFavorablePrice) {
    this.channelFavorablePrice = channelFavorablePrice;
  }

  public Long getSkuId() {
    return skuId;
  }

  public void setSkuId(Long skuId) {
    this.skuId = skuId;
  }

  public String getOutsideLink() {
    return outsideLink;
  }

  public void setOutsideLink(String outsideLink) {
    this.outsideLink = outsideLink;
  }

  public String getGoodsOriginImgUrl() {
    return goodsOriginImgUrl;
  }

  public void setGoodsOriginImgUrl(String goodsOriginImgUrl) {
    this.goodsOriginImgUrl = goodsOriginImgUrl;
  }



}
