import java.util.*;

public class LambdaExpressions {
    public static void main(String[] args) {

        List<String> names = Arrays.asList(
                "Sahil",
                "Rahul",
                "Amit",
                "Kiran");

        Collections.sort(names, (a, b) -> a.compareTo(b));

        System.out.println(names);
    }
}