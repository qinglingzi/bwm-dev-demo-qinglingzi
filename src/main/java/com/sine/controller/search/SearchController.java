package com.sine.controller.search;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sine.controller.BaseController;
import com.sine.utils.HttpRequestUtils;


@Controller
public class SearchController extends BaseController {

  private static Logger logger = LoggerFactory.getLogger(SearchController.class); // 日志记录

  /**
   * 搜索
   * 
   * @param model
   * @throws IOException 
   * @throws JsonMappingException 
   * @throws JsonParseException 
   */
  @RequestMapping(value = "/s")
  public String search(Model model, HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException {
    String str =
        HttpRequestUtils.httpGetBase(
            getHttpClient(request),
            "http://s.b5m.com/search/product.htm?authCode=172ca9138968b5f3dd28a3d944f51caa&brandId=&platformId=33&categoryId=&activityId=&props=&sortType=&sortDesc=&activityRecommend1=&activityRecommend2=&isGetHeader=false&pageIndex=1&pageSize=8",
            null);
    ObjectMapper mapper = new ObjectMapper();
    Map map = mapper.readValue(str, Map.class);
    model.addAttribute("result", map);
    model.addAttribute("userInfo", getUserInfo(request));
    return "search/s";
  }
}
