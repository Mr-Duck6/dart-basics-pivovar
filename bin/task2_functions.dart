void main() {
  calculateSum(10, 20);

  calculateAverage([10.0, 20.0, 30.0, 40.0]);

  print(formatName('Іван', 'Петренко'));
  print(
    formatName(
      'Іван',
      'Петренко',
      middleName: 'Олександрович',
      uppercase: true,
    ),
  );

  testFunctionalProgramming();

  print('\nТест fibonacci та factorial');
  print('Факторіал 4: ${factorial(4)}');
}

int calculateSum(int a, int b) {
  print(a + b);
  return a + b;
}

double calculateAverage(List<double> numbers) {
  double sum = 0;

  for (int i = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }
  sum /= numbers.length;
  print(sum);
  return sum;
}

String formatName(
  String firstName,
  String lastName, {
  String? middleName,
  bool uppercase = false,
}) {
  List<String> parts = [lastName, firstName];

  if (middleName != null && middleName.isNotEmpty) {
    parts.add(middleName);
  }

  String fullName = parts.join(' ');

  return uppercase ? fullName.toUpperCase() : fullName;
}

void testFunctionalProgramming() {
  int calculate(int a, int b, int Function(int, int) operation) {
    return operation(a, b);
  }

  int sum = calculate(10, 5, (x, y) => x + y);
  int multiply = calculate(10, 5, (x, y) => x * y);

  print('Додавання через функцію: $sum');
  print('Множення через функцію: $multiply');

  List<int> numbers = [1, 2, 3, 4, 5, 6];
  var evenNumbers = numbers.where((n) => n % 2 == 0).toList();
  print(evenNumbers);

  var multiplied = numbers.map((n) => n * 10).toList();
  print('Map: $multiplied');

  int totalSum = numbers.fold(
    0,
    (accumulator, element) => accumulator + element,
  );
  print(totalSum);

  int outerValue = 10;
  Function makeAdder(int addBy) {
    return (int value) {
      return value + addBy + outerValue;
    };
  }

  var addFiveAndOuter = makeAdder(5);
  int result = addFiveAndOuter(20);
  print('Результат замикання: $result');
}

int fibonacci(int n) {
  int n2 = n - 1;
  int n3 = n - 2;
  return n = n2 + n3;
}

int factorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return fibonacci(result);
}
