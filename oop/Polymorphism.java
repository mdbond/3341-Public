class Person {
  String name;

  Person(String name) {
    this.name = name;
  }
  String getName() {
    return name;
  }
}

class Judge extends Person {
  int yearsOfExperience;

  Judge(String name, int years) {
    super(name);
    this.yearsOfExperience = years;
  }
  String getName() {
    return "Judge " + super.getName();
  }
}

public class Polymorphism {
  public static void main(String[] args) {
    Person p1 = new Person("Steve");
    Person p2 = new Judge("Judy", 15);

    printInfo(p1);
    printInfo(p2);
  }

  static void printInfo(Person p) {
    System.out.println("p.name = " + p.name);
    System.out.println("p.getName() = " + p.getName()); // compile-time target is Person.getName(p)
    try {
      System.out.println("p.yearsOfExperience = " + ((Judge)p).yearsOfExperience);
    } catch (ClassCastException ex) {
      System.out.println(ex);
    }
  }
}

