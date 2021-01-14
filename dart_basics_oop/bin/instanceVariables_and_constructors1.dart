import 'dart:math';

// ПЕРЕМЕННЫЕ ЭКЗЕМПЛЯРА И КОНСТРУКТОРЫ

class Paladin {
  num level; // свойство, по умолчанию, если мы не инициализируем свойство, то будет null
  num attack; // у свойств, все переменные экземпляра неявно создают свои гетеры и сетеры (get and set)
  num defense;

  // КОНСТРУКТОРЫ - имеют тоже имя, что и его класс.
  // Конструкторы не наследуются, подклассы не наследуют конструкторы от своего суперкласса
  // Подкласс, который не объявляет конструкторов имеет только конструкторы по умолчанию
  // Paladin(num level, num attack, num defense) { // Параметры конструктора
  //   this.level = level; // инициализация свойств
  //   this.attack = attack;
  //   this.defense = defense;
  // }

  // Синтаксический сахар для инициализации свойств
  Paladin.lighter({this.level, this.attack = 5, this.defense = 7});

  // Именованные конструкторы
  Paladin.darker({this.level, this.attack = 17, this.defense = 3});

  // Чтобы не писать много лишнего кода, переоределим строковое представление нашего объекта
  @override
  String toString() => 'Paladin: level = [$level], attack = [$attack], defense = [$defense]';
}


// НАСЛЕДОВАНИЕ - EXTENDS
class LightWarrior extends Paladin {
  num lightPower;

  LightWarrior.lighter({this.lightPower = 99.99}) : super.lighter(level: 1); // чтобы вызвать конструктор именованного суперкласса
  // нужно написать : super.lighter(level: 1) - инициализируем только level: 1, т.к остальные параметры в суперклассе 
  // заданы по умолчанию.

  // Аргументы конструктора суперкласса оцениваются компилятором, перед вызовом конструктора. А это значит, что аргумент может быть
  // выражением или значением которое может вернуть функцию например.
  LightWarrior() : super.lighter(level: _epicLevelRandom()); // когда мы обращаемся к суперклассу у нас не может быть никаких ключ. слов this, т.е
  // не можем обращаться к объекту, только статик аргументы.

  static int _epicLevelRandom() => Random().nextInt(100);

  @override
  String toString() {  
    return lightPower != null ? '${super.toString()}, lightPower = [$lightPower]' : super.toString();
  }
}

void main() {
  Paladin newHero = Paladin.lighter(level: 1); // экземпляр объекта
  // newHero.level = 1; // = 1 - это setter
  // print(newHero.level);
  var darkHero = Paladin.darker(level: 1);
  var lightW = LightWarrior.lighter();
  var lightWFun = LightWarrior();

  print(newHero);
  print(darkHero);
  print(lightW);
  print(lightWFun);
}
