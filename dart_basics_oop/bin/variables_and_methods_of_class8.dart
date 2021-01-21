// ПЕРЕМЕННЫЕ И МЕТОДЫ КЛАССА
// Extensions methods, переопределение операторов

// У Dart есть возможность переопределить операторы: +, -, /, * и т.д
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
}

// Как реагировать на вызов не реализованного метода в классе?
class MyClass {
  @override
  // Как отловить такой не реализованный метод? Переопределить noSuchMethod
  void noSuchMethod(Invocation inv) {
    print('Вы пытаетесь использовать не реализованный метод ${inv.memberName}');
  }
  void hello();
}

// Методы расширения (Extensions methods).
// В Dart есть возможность расширять уже существующие классы.
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
  double parseDouble() {
    return double.parse(this);
  }
}

// Переменные и методы класса.
// Для задания переменных и методов класса используют ключевое слово static.
// Обычно в связке с const задаются константы у класса.
class MyStaticClass {
  static const PI = 3.14;
  
  static void hi() => print('Static method!');
}

void main() {
  var v1 = Vector(1, 2);
  var v2 = Vector(3, 4);

  print('(${(v1 + v2).x}, ${(v1 + v2).y})');

  var h = MyClass();
  h.hello();

  print('777'.parseInt() is int);
  print('888.77'.parseDouble() is double);

  // Раз это у нас статический метод, то он не имеет доступ к ключ. слову this,
  // потому что у нас не создается экземпляр объекта.
  // Но лучше static методами и свойствами не злоупотреблять, лучше использовать TopLevel функции
  print(MyStaticClass.PI);
  MyStaticClass.hi();
}
