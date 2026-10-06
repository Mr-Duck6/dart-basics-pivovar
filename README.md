# Практична робота 4: Основи мови Dart
## Структура проєкту

Проєкт організовано відповідно до стандартних рекомендацій для пакетів Dart:

```text
dart_basics_pivovar/
│
├── bin/                        # Виконувані скрипти з демонстрацією завдань
│   ├── dart_basics_pivovar.dart
│   ├── task1_variables.dart    # Демонстрація змінних, типів та Null Safety
│   ├── task2_functions.dart    # Функції, замикання (Closures), FP
│   ├── task3_classes.dart      # ООП, взаємодія класів університетської системи
│   ├── task4_collections.dart  # Робота з List, Set, Map та розширені операції
│   └── task5_async.dart        # Асинхронність (Future, Stream, обробка файлів)
│
├── lib/                        # Бібліотека з бізнес-логікою та моделями
│   ├── models/
│   │   ├── course.dart         # Модель навчального курсу
│   │   ├── student.dart        # Модель студента з підтримкою JSON
│   │   └── university.dart     # Абстрактний клас Person, Professor та University
│   └── utils/
│       └── data_processor.dart # Утиліта для обробки даних (фільтрація, сортування)
│
├── tests/                      # Модульні тести
│   ├── models_test.dart
│   └── utils_test.dart
│
├── pubspec.yaml                # Конфігурація залежностей та метадані проєкту
└── README.md                   # Документація проєкту
```
## Опис файлів проєкту загалом
Директорія bin/: Містить точки входу (файли з функцією main), кожен з яких відповідає за виконання окремого практичного завдання (від вивчення змінних до асинхронних операцій та роботи з файловою системою).

* Директорія lib/models/: Зберігає основні бізнес-моделі предметної області (студент, курс, університет, викладач, учасник освітнього процесу).

* Директорія lib/utils/: Містить допоміжні класи-утиліти з алгоритмами обробки, фільтрації та сортування даних.

* Директорія tests/: Містить модульні тести для перевірки правильності роботи моделей та утиліт.

* pubspec.yaml: Головний конфігураційний файл проєкту, що керує залежностями та налаштуваннями пакета.

## Архітектура та діаграма класів
classDiagram

    class Person {
        <<abstract>>
        +String id
        +String firstName
        +String lastName
        +DateTime birthDate
        +String fullName*
        +int age*
        +String role*
    }

    class Professor {
        +String department
        +List~String~ taughtCourses
        +double salary
        +String fullName
        +int age
        +String role
    }

    class Student {
        +String id
        +String firstName
        +String lastName
        +DateTime birthDate
        +List~String~ enrolledCourses
        +Map~String, double~ grades
        +String fullName
        +int age
        +double gpa
        +void enrollInCourse(String courseId)
        +void addGrade(String courseId, double grade)
        +List~String~ getPassedCourses()
        +Map toJson()
    }

    class Course {
        +String id
        +String name
        +String description
        +int credits
        +String instructor
        +List~String~ prerequisites
        +bool hasPrerequisites()
        +bool canStudentEnroll(Student student)
    }

    class University {
        +String name
        +List~Student~ students
        +List~Professor~ professors
        +List~Course~ courses
        +void addStudent(Student student)
        +void removeStudent(String studentId)
        +Student findStudentById(String id)
        +List~Student~ getStudentsByCourse(String courseId)
        +List~Course~ getAvailableCoursesForStudent(String studentId)
        +Map generateStatistics()
    }

    Person <|-- Professor : extends
    University "1" --> "*" Student : manages
    University "1" --> "*" Professor : employs
    University "1" --> "*" Course : offers
    Course --> Student : checks eligibility

### 1. lib/models/university.dart
* **Абстрактний клас Person**:
  * **Поля**: id (унікальний ідентифікатор), firstName (ім'я), lastName (прізвище), birthDate (дата народження).
  * **Абстрактні геттери**: fullName (повне ім'я), age (вік), role (роль у системі).
* **Клас Professor** (успадковує Person):
  * **Поля**: department (кафедра), taughtCourses (список викладених курсів), salary (заробітна плата).
  * **Методи/Геттери**: Реалізує fullName, обчислення віку age та повертає роль Professor.
* **Клас University**:
  * **Поля**: name (назва університету), students (список студентів), professors (список викладачів), courses (список курсів).
  * **Методи**:
    * addStudent(Student student) - додає студента до списку, якщо його ще немає.
    * removeStudent(String studentId) - видаляє студента за ID.
    * findStudentById(String id) - здійснює пошук студента за ID.
    * getStudentsByCourse(String courseId) - повертає список студентів, які навчаються на певному курсі.
    * getAvailableCoursesForStudent(String studentId) - визначає доступні курси для студента з урахуванням пререквізитів.
    * generateStatistics() - формує загальну статистику університету у вигляді Map.

### 2. lib/models/student.dart
* **Клас Student**:
  * **Поля**: id, firstName, lastName, birthDate, enrolledCourses (список ID курсів), grades (словник оцінок за курсами).
  * **Геттери**: fullName, age, gpa (розрахунок середнього бала).
  * **Методи**:
    * enrollInCourse(String courseId) - записує студента на курс.
    * addGrade(String courseId, double grade) - додає або оновлює оцінку за курс.
    * getPassedCourses() - повертає список курсів, де оцінка $\ge 60$ балів.
    * `toString() - текстове представлення студента.
    * toJson() / фабричний конструктор Student.fromJson() - серіалізація та десеріалізація даних.

### 3. lib/models/course.dart
* **Клас Course**:
  * **Поля**: id, name (назва), description (опис), credits (кредити), instructor (викладач), prerequisites (вимоги/попередні курси).
  * **Методи**:
    * hasPrerequisites() - перевіряє наявність попередніх вимог.
    * canStudentEnroll(Student student) - перевіряє, чи склав студент усі необхідні курси для допуску.
    * toString() - текстове представлення курсу.

### 4. lib/utils/data_processor.dart
* **Клас DataProcessor**:
  * **Методи (статичні)**:
    * filterEvenNumbers(List<int> numbers) - фільтрує парні числа.
    * countWords(String text) - підраховує частоту слів у тексті.
    * sortStudentsByGPA(List<Student> students) - сортує студентів за зменшенням середнього бала.
    * groupStudentsByYear(List<Student> students) - групує студентів за роком народження.

## Інструкція: як запускати файли із завданнями
1. Переконайтеся, що у вас встановлено Dart SDK
2. Завдання 1 - dart run bin/task1_variables.dart
3. Завдання 2 - dart run bin/task2_functions.dart
4. Завдання 3 - dart run bin/task3_classes.dart
5. Завдання 4 - dart run bin/task4_collections.dart
6. Завдання 5 - dart run bin/task5_async.dart

## Використані джерела
* Офіційна документація мови Dart: dart.dev/guides - довідник щодо синтаксису, об'єктно-орієнтованої моделі, асинхронного програмування (Future/Stream) та роботи з колекціями.
* Dart API Reference: api.dart.dev - документація по стандартних бібліотеках dart:core, dart:io та dart:convert.
* Методичні матеріали та університетські практичні завдання з розробки програмного забезпечення на мові Dart та побудови архітектури додатків.

## Використання ШІ
Під час виконання завдання, ШІ був використаний для вивчення синтаксису Dart та аналізу правильності коду.
