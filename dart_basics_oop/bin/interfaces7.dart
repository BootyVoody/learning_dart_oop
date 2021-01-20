// Интерфейсы, неявные интерфейсы.
// В Dart интерфейсы, это неявные интерфейсы, потому что каждый класс неявно определяет интерфейс.

class Person {
  final _name;

  Person(this._name);

  String greet(String who) => 'Привет, $who. Меня зовут $_name';
}

// Класс Impostor реализует неявный интерфейс Person, где необходимо реализовать наши свойства и методы name и greet
class Impostor implements Person {
  get _name => '';
  String greet(String who) => 'Дарова, $who';
}

String greetBob(Person person) => person.greet('Bob');

void main() {
  print(greetBob(Person('Alex')));
  print(greetBob(Impostor()));
}

// Немного теории.
// Отличия абстрактного класса он интерфейса (для языка Dart)
// 1. Абстрактный класс описывает что реализовывать, но не описывает как.
//    Интерфейс описывает что нужно реализовывать и при этом имеет свою реализацию.
// 2. В Dart нет множественного наследования.
//    Абстрактный класс наследовать можно только 1.
//    Интерфейсов можно реализовывать несколько для класса.
// 3. Экземпляр абстрактного класса создать нельзя.
//    Экземпляр интерфейса (неявного) создать можно.
// 4. Абстрактный класс связывает между собой и объединяет классы имеющие очень близкую связь.
//    Интерфейс могут реализовывать классы, у которых вообще нет ничего общего.