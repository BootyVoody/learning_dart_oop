// Фабричные конструкторы.
// Этот конструктор не всегда создает новый экземпляр своего класса, например, он может его возвращать из кеша.

class Logger {
  final String name;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    // putIfAbsent - найти значение по [ключу] или добавить новое значение, если его там нет.
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  Logger._internal(this.name) {
    print('Call constructor');
  }
}

void main() {
  var logger1 = Logger('log');
  var logger2 = Logger('log');
  var logger3 = Logger('log!');

  print(logger1);
  print(logger2);
  print(logger3);
}
