package test;

import java.io.IOException;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.sine.utils.Message;


public class JackensonTest {
  public static void main(String[] args) {
    String message2 ="{\"code\":-1,\"ok\":true,\"data\":\"\u53c2\u6570\u975e\u6cd5\"}";
    ObjectMapper mapper = new ObjectMapper();
    try {
      Message  a =mapper.readValue(message2, Message.class);
      System.out.println(a.toString());
    } catch (JsonParseException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (JsonMappingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }
}
