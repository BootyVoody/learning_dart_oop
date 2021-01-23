// Обобщенные типы, Generics

// Во-вторых generics используются для избежания дублирования кода:
abstract class Cache<T> { // <T> - обощенный generic (обобщение)
  T getByKey(String key);
  void setByKey(String key, T value);
}

class MyCache extends Cache<int> {
  var cache = {};

  getByKey(String key) {
    return cache[key];
  }

  void setByKey(key, value) {
    cache[key] = value;
  }
}

// Ограничение типа
class SomeBaseClass {

}

class Foo<T extends SomeBaseClass> { // Будем указывать что этот тип может быть только типом который мы указываем, либо его подклассами
  String toString() => 'Foo';
}

class Extender extends SomeBaseClass {

}

// Generic можно использовать не только к классам, но и к методам
// Метод с Generics
class MyClass<T> {
  T bar<T>(List<T> mylist) {
    T tmp = mylist[0];
    return tmp;
  }
}

void main() {
  var stringList = List<String>(); // <String> - это Generic, т.е, например, какой тип у нас содержит коллекция
  stringList.add('a');
  // stringList.add(1234); - нельзя положить integer в коллекцию типа String
  
  var cache = MyCache();
  cache.setByKey('key', 098987);
  print(cache.getByKey('key'));

  // У коллекций можно перед их литералом можно сразу ставить generic тип
  var games = <String> ['Gothic 1', 'Gothic 2', 'Gothic 3', 'Gothic 2'];
  var uniqueTerm = <String> {'strength', 'agility', 'stamina'};
  var pages = <String, String> {
    'index.html': 'Homepage',
    'admin.html': 'Admin area'
  };

  // Наши generics можно использовать конструктор для указания с какими типами они будут работать
  var gameSet = Set<String>.from(games);
  print(gameSet);

  // Generics в Dart сохраняют информацию о своих типах во время выполнения
  print(games is List<String>);

  // Ограничение типа
  var someBaseClassFoo = Foo<SomeBaseClass>();
  var extenderFoo = Foo<Extender>();
  var foo = Foo();
  // var foo1 = Foo<Object>(); // Через ключевое слово extends мы огранили наш generic T, следовательно использовать тип
  // Object мы не можемs
}
