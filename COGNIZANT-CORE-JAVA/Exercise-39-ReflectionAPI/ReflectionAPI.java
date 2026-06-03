import java.lang.reflect.Method;

class Demo {
    public void show() {
        System.out.println("Reflection Method Called");
    }
}

public class ReflectionAPI {

    public static void main(String[] args) {

        try {
            Class<?> cls = Class.forName("Demo");

            Object obj = cls.getDeclaredConstructor().newInstance();

            Method[] methods = cls.getDeclaredMethods();

            for (Method m : methods) {
                System.out.println("Method: " + m.getName());
                m.invoke(obj);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}