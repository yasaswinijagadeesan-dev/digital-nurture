import java.util.List;

record Person(String name, int age) {}

public class RecordsDemo {
    public static void main(String[] args) {

        List<Person> people = List.of(
                new Person("Sahil", 22),
                new Person("Rahul", 17),
                new Person("Amit", 25)
        );

        people.stream()
                .filter(p -> p.age() >= 18)
                .forEach(System.out::println);
    }
}