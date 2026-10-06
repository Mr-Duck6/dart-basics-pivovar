
void main() {
  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();
}

void demonstrateNumbers() {
  int Intvariable = 5;
  double doublevariable = 5.5;

  //Математичні операції
  Intvariable += 1;
  print(Intvariable);
  doublevariable += 1.1;
  print(doublevariable);

  //Конкатенація
  double IntToDouble = Intvariable.toDouble();
  print(IntToDouble);
  int DoubleToInt = doublevariable.toInt();
  print(DoubleToInt);

  //Перевірка типів
  if (Intvariable is int) {
    print('Int');
  } else if (Intvariable is double) {
    print('double');
  }
}

void demonstrateStrings() {
  String stringvariable = 'Hello';
  String stringvariable2 = "World";

  //Интерполяция
  print("$stringvariable $stringvariable2, is a string");

  //Конкатенация
  String concatenatedString = stringvariable + " " + stringvariable2;
  print(concatenatedString);

  //Методи
  print(stringvariable.isEmpty);
  print(stringvariable.length);
  print(stringvariable.isNotEmpty);

  //Змінення регістру
  print(stringvariable.toUpperCase());
  print(stringvariable.toLowerCase());

  //Пошук підрядка
  String sentence = "Привіт Dart";
  print(sentence.contains("Dart"));
  print(sentence.startsWith("Привіт"));
  print(sentence.endsWith("Dart"));
  print(sentence.indexOf("Dart"));

  //Розділення рядка
  String stringvariable3 = "hello,world,dart";
  print(stringvariable3.substring(0, 5));
}

void demonstrateBooleans() {
  int integer1 = 10;
  bool isboolornot = false;

  if (isboolornot == true) {
    print("Boolean is true");
  } else if (isboolornot == false) {
    print("Boolean is false");
  }
}

void demonstrateCollections() {
  List<int> intlist = [1, 2, 3, 4, 5];
  intlist.add(6);
  print(intlist);

  Set<int> intset = {1, 2, 3, 4, 4};
  intset.add(5);
  intset.add(4);
  print(intset);
}

void demonstrateNullSafety() {
  //int b = null; пимилка
  int? b = null;

  String? hello = null;
  print(hello?.length);

  String? username;
  String displayName = username ?? "Гость";
  print(displayName);

  int? score;
  print(score ?? 0);

  late String name;
}
