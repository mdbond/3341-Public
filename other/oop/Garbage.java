import java.util.LinkedList;

class Person {
  String name;

  Person(String name) {
    this.name = name;
  }
  String getName() {
    return name;
  }
  protected void finalize() {
    System.out.println("Collected " + getName());
  }
}

class Judge extends Person {
  Person stenographer;

  Judge(String name, Person stenographer) {
    super(name);
    this.stenographer = stenographer;
  }
  String getName() {
    return "Judge " + super.getName();
  }
}

public class Garbage {

  static Person createPeople() {
    Person steve = new Person("Steve");
    Person judy = new Judge("Judy", steve);

    return judy;
  }

  public static void main(String[] args) {

    Person p = createPeople();

    try {
      LinkedList<Object> list = new LinkedList<Object>();
      for (int i = 0; i < 10000000; i++) {        
        list.add(new Object());
        list.add(new Object());
        list.removeFirst();
      }
    } catch (OutOfMemoryError e) {
      e.printStackTrace();
    }

    System.out.println(p); // needed so p is still live
  }
}
