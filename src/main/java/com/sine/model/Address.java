package com.sine.model;

import java.io.Serializable;

public class Address implements Serializable {

  /**
   * 
   */
  private static final long serialVersionUID = 7263053281747918742L;
  private Long addressid;
  private Long cityId;
  private String cityName;
  private boolean def;
  private String detailAddress;
  private Long districtId;
  private String districtName;
  private String mobile;
  private Long provinceId;
  private String provinceName;
  private String qq;
  private String userName;
  private String zipcode;

  public Address() {
    // TODO Auto-generated constructor stub
  }

  public Long getAddressid() {
    return addressid;
  }

  public void setAddressid(Long addressid) {
    this.addressid = addressid;
  }

  public Long getCityId() {
    return cityId;
  }

  public void setCityId(Long cityId) {
    this.cityId = cityId;
  }

  public String getCityName() {
    return cityName;
  }

  public void setCityName(String cityName) {
    this.cityName = cityName;
  }

  public boolean isDef() {
    return def;
  }

  public void setDef(boolean def) {
    this.def = def;
  }

  public String getDetailAddress() {
    return detailAddress;
  }

  public void setDetailAddress(String detailAddress) {
    this.detailAddress = detailAddress;
  }

  public Long getDistrictId() {
    return districtId;
  }

  public void setDistrictId(Long districtId) {
    this.districtId = districtId;
  }

  public String getDistrictName() {
    return districtName;
  }

  public void setDistrictName(String districtName) {
    this.districtName = districtName;
  }

  public String getMobile() {
    return mobile;
  }

  public void setMobile(String mobile) {
    this.mobile = mobile;
  }

  public Long getProvinceId() {
    return provinceId;
  }

  public void setProvinceId(Long provinceId) {
    this.provinceId = provinceId;
  }

  public String getProvinceName() {
    return provinceName;
  }

  public void setProvinceName(String provinceName) {
    this.provinceName = provinceName;
  }

  public String getQq() {
    return qq;
  }

  public void setQq(String qq) {
    this.qq = qq;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getZipcode() {
    return zipcode;
  }

  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }


}
