// Методы экземпляра, getters, setters

class Paladin {
  final num attack;
  final num defense;
  final num lightPower;

  Paladin(this.attack, this.defense) : lightPower = 7;

  // Метод
  num superLightAttack() {
    return attack + lightPower - 1;
  }
}

// getter and setters
// Как они задаются и записываются: для вычисляемых свойств будут использоваться гетеры и сетеры и записываться они будут после
// указанного типа, но перед именем свойства.
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;
  set right(num value) => left = value - width;

  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

void main() {
  var hero = Paladin(12, 20);
  print(hero.superLightAttack());

  var rect = Rectangle(10, 15, 20, 40);
  print(rect.left);
  rect.right = 12;
  print(rect.left);
}
