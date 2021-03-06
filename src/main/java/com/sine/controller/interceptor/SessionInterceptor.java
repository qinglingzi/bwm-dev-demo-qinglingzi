package com.sine.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * 
 * @author sine
 *
 */
public class SessionInterceptor implements HandlerInterceptor {
  
  private static Logger logger = LoggerFactory.getLogger(SessionInterceptor.class); // 日志记录

  /**
   * 在业务处理器处理请求之前被调用 如果返回false 从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
   * 
   * 如果返回true 执行下一个拦截器,直到所有的拦截器都执行完毕 再执行被拦截的Controller 然后进入拦截器链, 从最后一个拦截器往回执行所有的postHandle()
   * 接着再从最后一个拦截器往回执行所有的afterCompletion()
   */
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    // 验证是否登录
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("_email");
    logger.debug(">>>>>>>>>>>email>>>>>>>>>"+email);
    if (email == null) {
      response.sendRedirect(request.getContextPath()+"/user/login.htm");
      return false;
    }
    return true;
  }

  /**
   * 在业务处理器处理请求执行完成后,生成视图之前执行的动作
   */
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {}

  /**
   * 在DispatcherServlet完全处理完请求后被调用
   * 
   * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()
   */
  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
      Object handler, Exception ex) throws Exception {}

}
