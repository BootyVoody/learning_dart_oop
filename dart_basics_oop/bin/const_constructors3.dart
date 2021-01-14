// Постоянные/константные конструкторы
class ImmutablePoint {
  final num x, y;
  const ImmutablePoint(this.x, this.y);
}

void main() {
  var p1 = const ImmutablePoint(1, 1);
  var p2 = const ImmutablePoint(1, 1);

  print(p1 == p2);
}
