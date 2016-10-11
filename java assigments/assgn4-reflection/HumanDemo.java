import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Type;

/**
 * Created by Ika on 06.10.2016.
 */
public class HumanDemo {
    public static void main(String[] args) {
        try {
            Class humanClass = Class.forName("Human");
            Object obj = humanClass.newInstance();
            Field[] f = humanClass.getDeclaredFields();
            System.out.println("fieldebis saxelebia: ");
            for (int i = 0; i < f.length; i++){
                System.out.println(f[i].getName());
            }

            Method[] m = humanClass.getDeclaredMethods();
            System.out.println("metodebia ");
            for (int i = 0; i < m.length; i++){
                System.out.println(m[i].getName());

                m[i].setAccessible(true);
                m[i].invoke(obj, null);

            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
