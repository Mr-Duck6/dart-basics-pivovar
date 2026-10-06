void main() {
  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  demonstrateAdvancedOperations();
}

void demonstrateLists() {
  List<int> list1 = [1, 2, 3, 4, 5];

  var multiplied = list1.map((number) => number * 2).toList();
  print(multiplied);

  var filtered = list1.where((number) => number > 2).toList();
  print(filtered);

  var sumReduce = list1.reduce((value, element) => value + element);
  print(sumReduce);

  var sumFold = list1.fold(100, (sum, element) => sum + element);
  print(sumFold);
}

void demonstrateSets() {
  Set<int> set1 = {2, 3, 6, 1};
  Set<int> set2 = {6, 7, 8};

  var unionSet = set1.union(set2);
  print(unionSet);

  var intersectionSet = set1.intersection(set2);
  print(intersectionSet);
}

void demonstrateMaps() {
  Map<String, double> gradesMap = {'Sasha': 85.0, 'Kirill': 92.5};

  gradesMap['Ivan'] = 78.0;

  gradesMap.forEach((name, grade) {
    print('Студент: $name, бал: $grade');
  });
}

void demonstrateAdvancedOperations() {
  List<int> numbers = [10, 15, 20, 25, 30];

  var result = numbers.where((n) => n % 2 == 0).map((n) => n * 3).toList();

  print(result);
}
