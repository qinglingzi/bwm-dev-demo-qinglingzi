package com.sine.controller.pay;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sine.controller.BaseController;
import com.sine.model.ProOrder;


@Controller
public class PayController extends BaseController {

  private static Logger logger = LoggerFactory.getLogger(PayController.class); // 日志记录

  @RequestMapping(value = "/pay")
  public void pay(Model model,String payNum, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException  {
    //从session中获取订单
    HttpSession session = request.getSession();
    ProOrder order = (ProOrder) session.getAttribute("order");
    model.addAttribute("payNum", payNum);
    model.addAttribute("order", order);
    model.addAttribute("userInfo", getUserInfo(request));
  }
}
