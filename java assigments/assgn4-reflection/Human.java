import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Created by Ika on 06.10.2016.
 */
public class Human {
    public String walkStr = "walking";
    private String flyStr="flying";

    public void walk(){
        System.out.println(walkStr);
    }

    private  void fly(){
        System.out.println(flyStr);
    }
}
