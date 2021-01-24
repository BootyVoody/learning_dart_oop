// Определения типов - Typedefs, Callable классы

// Определить тип для функции
typedef Compare<T> = int Function(T a, T b);

// Функция для сотриторвки
int sort(int a, int b) => a - b;

// Callable классы
// Чтобы позволить экземпляру класса вызываться как фукнция необходимо реализовать метод call
class CallableFunction {
  String call(String a, String b, String c) => '$a $b $c';
}

var wf = CallableFunction();
var out = wf('Code', 'and', 'art.');

void main() {
  print(sort is Compare<int>);
  print(out);
}
