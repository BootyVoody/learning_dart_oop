// СПИСОК ИНИЦИАЛИЗАТОРОВ

class Paladin {
  num level;
  num attack;
  num defense;

  // Помимо вызова суперкласса можно также инициализировать переменные экземпляра до запуска тела конструктора
  Paladin(int exp) :
    level = exp ~/ 10, // (exp / 10).truncate.toInt() - truncate это отбросить дробную часть, чтобы было целое число
    attack = exp + 10,
    defense = exp - 10 {
      print('Пример инициализаторов: level = $level, attack = $attack, defense = $defense');
    }
}

// Списки инициализаторов очень удобны при настройки final полей
class PaladinSecond {
  num attack;
  num defense;
  num classRating;

  PaladinSecond(attack, defense) : 
    attack = attack,
    defense = defense,
    classRating = (attack + defense) * 10 / 2;
}

// Перенаправление конструкторов.
// Иногда единственной целью конструктора является перенаправление в другой конструктор, который создан в этом же классе.
// Тело перенаправляющего конструктора должно быть пустым, а вызов конструктора идет также через двоеточие

class PaladinThree {
  num attack;
  num defense;

  PaladinThree(this.attack, this.defense);
  PaladinThree.darker(num attack) : this(attack, 5);

  @override
  String toString() => 'Paladin <attack:$attack, defense:$defense>';
}

void main() {
  var p = Paladin(55);
  var paladinTwo = PaladinSecond(12, 20);
  var paladinThree = PaladinThree.darker(20);
  print(paladinTwo.classRating);
  print(paladinThree);
}
