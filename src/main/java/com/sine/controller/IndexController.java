package com.sine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IndexController extends BaseController {
  
  
  /**
   * 首页
   * @param model
   */
  @RequestMapping(value = "/index", method = RequestMethod.GET)
  public void index(Model model) {
  }
	
  /**
   * 跳转页面
   * @param model
   */
  @RequestMapping(value = "/forward", method = RequestMethod.GET)
  public String skipUrl(Model model,String method) {
    return method;
  }
}
