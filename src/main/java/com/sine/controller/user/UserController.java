package com.sine.controller.user;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.impl.client.CloseableHttpClient;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sine.controller.BaseController;
import com.sine.model.Address;
import com.sine.model.UserInfo;
import com.sine.utils.HttpClientPoolUtil;
import com.sine.utils.HttpRequestUtils;
import com.sine.utils.Message;
import com.sine.utils.ValidUtils;


@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

  private static Logger logger = LoggerFactory.getLogger(UserController.class); // 日志记录

  @Value("#{settings['ucenterOnline']}")
  private String ucenter;

  /**
   * 更改密码
   * 
   * @param model
   * @throws IOException 
   * @throws JsonMappingException 
   * @throws JsonParseException 
   */
  @RequestMapping(value = "/changePwd", method = RequestMethod.GET)
  public void changePwd(Model model,HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
    model.addAttribute("userInfo", getUserInfo(request));
  }
  
  /**
   * 更改密码
   * 
   * @param model
   */
  @RequestMapping(value = "/changePwd", method = RequestMethod.POST)
  @ResponseBody
  public Message changePwd(Model model,String password,String newPassword,HttpServletRequest request) {
    if(password==newPassword){
      return new Message(-1, false, "原密码跟新密码相同！");
    }
    if(StringUtils.isBlank(password)||StringUtils.isBlank(newPassword)){
      return new Message(-1, false, "密码为空");
    }
    Map<String,Object>  map = new HashMap<String, Object>();
    map.put("password", password);
    map.put("newPassword", newPassword);
    Message message = HttpRequestUtils.httpPost(getHttpClient(request), ucenter+"/user/info/data/editPwd.htm", map);
    return message;
  }
  
  /**
   * 登录页面
   * 
   * @param model
   */
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public void loginGet(Model model) {}
  
  /**
   * 发送验证码
   * 
   * @param model
   */
  @RequestMapping(value = "/sendCheckNum", method = RequestMethod.POST)
  @ResponseBody
  public Message sendCheckNum(Model model,String mobile, HttpServletRequest request) {
    return HttpRequestUtils.httpPost(getHttpClient(request), ucenter+"/user/info/findPwdByMobile1.htm?mobile="+mobile,null);
  }
  
  /**
   * 发送邮箱验证信息
   * 
   * @param model
   */
  @RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
  @ResponseBody
  public Message checkEmail(Model model,String email, HttpServletRequest request) {
    CloseableHttpClient client = getHttpClient(request);
    return HttpRequestUtils.httpGet(client, ucenter+"/user/info/data/isNameOrEmailUse.do?email="+email, null);
  }
  
  /**
   * 登录
   * 
   * @param model
   * @throws IOException
   * @throws JsonMappingException
   * @throws JsonParseException
   */
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  @ResponseBody
  public Message loginPost(Model model, String email, String password, HttpServletRequest request)
      throws JsonParseException, JsonMappingException, IOException {
    if (email == null) {
      return new Message(-1, false, "email异常");
    }
    CloseableHttpClient httpclient = HttpClientPoolUtil.getClient(email);
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("email", email);
    map.put("password", password);
    Message message =
        HttpRequestUtils.httpGet(httpclient, ucenter + "/user/user/data/login2.htm?jsonpCallback=",
            map);
    if (!message.isOk()) {
      return message;
    }
    String json =
        HttpRequestUtils.httpGetBase(httpclient, ucenter + "/user/user/data/info.htm?isSimple=2",
            null);
    if (json == null) {
      return new Message(-1, false, "异常");
    }
    ObjectMapper mapper = new ObjectMapper();
    Map userInfo = mapper.readValue(json, Map.class);
    if (userInfo != null) {
      Map user = (Map) userInfo.get("data");
      HttpSession session = request.getSession();
      session.setAttribute("_email", email);
      session.setAttribute("_userId", user.get("userId"));
      logger.debug(">>>>>>>>>session email>>>>>>>>>" + email);
      logger.debug(">>>>>>>>>session userId>>>>>>>>>" + user.get("userId"));
    }
    return message;
  }

  /**
   * 退出
   * 
   * @param model
   * @throws IOException 
   */
  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("_email");
    HttpClientPoolUtil.destroyClient(email);
    session.invalidate();
    return "redirect:login.htm";
  }

  /**
   * 注册页面
   * 
   * @param model
   */
  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registerPre(Model model) {}

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  @ResponseBody
  public Message register(Model model, String email, String password, HttpServletRequest request)
      throws JsonParseException, JsonMappingException, IOException {
    // 判断邮箱是否正确
    if (!ValidUtils.isEmail(email)) {
      return new Message(null, false, "邮箱出错");
    }
    // 判断邮箱是否已经存在
    // 判断密码是否正确
    if (password == null) {
      return new Message(null, false, "密码出错");
    }
    HashMap<String, Object> params = new HashMap<String, Object>();
    params.put("email", email);
    params.put("password", password);
    CloseableHttpClient httpclient = HttpClientPoolUtil.getClient(email);
    Message message =
        HttpRequestUtils.httpGet(httpclient, ucenter
            + "/user/info/data/register2.htm?jsonpCallback=", params);
    if (message.isOk()) {
      loginPost(model, email, password, request);
    }
    return message;
  }

  /**
   * 用户首页
   * 
   * @param model
   */
  @RequestMapping(value = "/index", method = RequestMethod.GET)
  public void userCenter(Model model) {

  }

  /**
   * 用户中心页面
   * 
   * @param model
   * @throws IOException
   * @throws JsonMappingException
   * @throws JsonParseException
   */
  @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
  public String userInfo(Model model, HttpServletRequest request) throws JsonParseException,
      JsonMappingException, IOException {
    model.addAttribute("userInfo", getUserInfo(request));
    return "user/userInfo";
  }

  /**
   * 更改用户信息
   * 
   * @param model
   * @throws NoSuchMethodException
   * @throws InvocationTargetException
   * @throws IllegalAccessException
   */
  @RequestMapping(value = "/updateInfo")
  @ResponseBody
  public Message updateInfo(Model model, UserInfo info, HttpServletRequest request)
      throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
    // 判断参数是否正确
    // 省略....
    Map<String, Object> map = BeanUtils.describe(info);
    map.remove("class");
    logger.debug(">>>>>>>>>updateUserInfo>>>>>>>>>" + map);
    Message message =
        HttpRequestUtils.httpGet(getHttpClient(request), ucenter + "/user/info/data/baseUpdate.htm?jsonpCallback=", map);
    return message;
  }

  /**
   * 用户地址添加
   * 
   * @param model
   * @throws NoSuchMethodException
   * @throws InvocationTargetException
   * @throws IllegalAccessException
   */
  @RequestMapping(value = "/addressAdd", method = RequestMethod.POST)
  @ResponseBody
  public Message addressAdd(Model model, Address address, HttpServletRequest request)
      throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
    // http://ucenter.b5m.com/user/address/data/save.htm
    // 判断参数是否正确
    // 省略....
    HttpSession session = request.getSession();
    String userId = (String) session.getAttribute("_userId");
    logger.debug(">>>>>>>>>>>>>>>>>>>  _userId:>>>>>>>>>>>>>>>>>>>"+userId);
    Map<String, Object> map = BeanUtils.describe(address);
    map.remove("class");
    map.put("userId", userId);
    Message message =
        HttpRequestUtils.httpPost(getHttpClient(request), ucenter + "/user/address/data/save.htm", map);
    return message;
  }

}
