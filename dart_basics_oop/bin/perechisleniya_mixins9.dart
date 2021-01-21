// Перечилсения и миксины

// Перечисления или enums представляют собой особый вид класса, когда объявляется перечисление,
// то передается набор допустимых значений, которые могут принимать экземпляры перечислений,
// так же этим значениям могут быть присвоены имена, которые будут понятны для пользователя.
enum Color { red, green, blue }

// Примеси - mixin
// Примеси позволяют привнести классу дополнительную функциональность не используя наследование.
// Миксинов можно примешивать в класс сколько угодно
mixin BasicFeaturesMixin on Paladin { // Так же можно указать какие именно типы может использовать этот миксин (on Paladin)
  num strength = 5;
  num agility = 5;
  num stamina = 5;
  void recover() => print('Восстановление силы');
}

class Paladin {
  num defense = 15;
  void lightPower() => print('Эпическая сила');
}

class LightWarrior extends Paladin with BasicFeaturesMixin {
  num attack;
  LightWarrior(this.attack);
}

void main() {
  print(Color.red.index);
  print(Color.green.index);
  print(Color.blue.index);

  // Чтобы получить все значения из перечисления, нужно вызвать свойство values
  List<Color> colors = Color.values;
  print(colors);

  // Как работать с перечислениями
  var aColor = Color.green;

  switch (aColor) {
    case Color.red:
      print('Красный');
      break;
    case Color.green:
      print('Зеленый');
      break;
    default:
      print(aColor);
  }
  // Перечисления содержат следующие ограничения
  // 1 - нельзя от них наследоваться
  // 2 - нельзя смешивать (mixin)
  // 3 - нельзя реализовывать (implents)
  // 4 - нельзя создать экземпляр перечисления

  var light = LightWarrior(10);
  light.lightPower();
  light.recover();

  print('Сила = ${light.strength}');
  print('Ловкость = ${light.agility}');
  print('Выносливость = ${light.stamina}');
}
