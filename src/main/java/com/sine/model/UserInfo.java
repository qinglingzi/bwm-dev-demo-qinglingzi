package com.sine.model;

import java.io.Serializable;

/**
 * 用户信息
 * 
 * @author lscm
 *
 */
public class UserInfo implements Serializable {

  /**
   * 
   */
  private static final long serialVersionUID = 7552178896202810187L;
  private String userId;
  private String brithdayStr;
  private Integer city;
  private String constellation;
  private String currentResidence;
  private Integer day;
  private String email;
  private String gender;
  private String hometown;
  private String mobile;
  private Integer month;
  private String nickName;
  private Integer province;
  private String realName;
  private String year;

  public UserInfo() {
    // TODO Auto-generated constructor stub
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getBrithdayStr() {
    return brithdayStr;
  }

  public void setBrithdayStr(String brithdayStr) {
    this.brithdayStr = brithdayStr;
  }

  public Integer getCity() {
    return city;
  }

  public void setCity(Integer city) {
    this.city = city;
  }

  public String getConstellation() {
    return constellation;
  }

  public void setConstellation(String constellation) {
    this.constellation = constellation;
  }

  public String getCurrentResidence() {
    return currentResidence;
  }

  public void setCurrentResidence(String currentResidence) {
    this.currentResidence = currentResidence;
  }

  public Integer getDay() {
    return day;
  }

  public void setDay(Integer day) {
    this.day = day;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getHometown() {
    return hometown;
  }

  public void setHometown(String hometown) {
    this.hometown = hometown;
  }

  public String getMobile() {
    return mobile;
  }

  public void setMobile(String mobile) {
    this.mobile = mobile;
  }

  public Integer getMonth() {
    return month;
  }

  public void setMonth(Integer month) {
    this.month = month;
  }

  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }

  public Integer getProvince() {
    return province;
  }

  public void setProvince(Integer province) {
    this.province = province;
  }

  public String getRealName() {
    return realName;
  }

  public void setRealName(String realName) {
    this.realName = realName;
  }

  public String getYear() {
    return year;
  }

  public void setYear(String year) {
    this.year = year;
  }
}
