# Практична робота 4: Основи мови Dart

## Завдання 1: Налаштування проекту та основи синтаксису
### Опис структури проекту
Була створена структура проекту, яка містить:

![alt text](image.png)

* **`README.md`**  опис завдань, інструкції.
* **`pubspec.yaml`**  технічне налаштування проекту.
* **`bin/`**  містить завдання 1-5:
  * `task1_variables.dart`  завдання 1.
  * `task2_functions.dart`  завдання 2.
  * `task3_classes.dart`  завдання 3.
  * `task4_collections.dart`  завдання 4.
  * `task5_async.dart`  завдання 5.
* **`lib/`**  містить папку `models/` та `utils/`:
  * `models/student.dart`  клас студента.
  * `models/course.dart`  клас курсів.
  * `models/university.dart`  клас університету (також містить клас професора та базовий клас людини).
  * `utils/calculator.dart`  програма калькулятор.
  * `utils/data_processor.dart`  тестування data processor.
* **`test/`**  містить тести:
  * `models_test.dart`  тест 1.
  * `utils_test.dart`  тест 2.

#### Блок-схема виконання (`task1_variables.dart`)
```mermaid
graph TD
    Start([Старт: main]) --> Nums[Виклик demonstrateNumbers]

    subgraph Numbers [demonstrateNumbers]
        Nums --> N1[Ініціалізація int = 5, double = 5.5]
        N1 --> N2[Математичні операції & print]
        N2 --> N3[Конвертація типів & print]
        N3 --> N4{Intvariable is int?}
        N4 -- Так --> N5[Друк 'Int']
        N4 -- Ні --> N6[Друк 'double']
    end

    Nums -->|Кінець| Strs[Виклик demonstrateStrings]

    subgraph Strings [demonstrateStrings]
        Strs --> S1[Ініціалізація рядків]
        S1 --> S2[Інтерполяція та конкатенація]
        S2 --> S3[Методи: isEmpty, length, toUpperCase...]
        S3 --> S4[Пошук підрядка: contains, indexOf...]
        S4 --> S5[Підрядок: substring]
    end

    Strs -->|Кінець| Bools[Виклик demonstrateBooleans]

    subgraph Booleans [demonstrateBooleans]
        Bools --> B1[Ініціалізація integer1 та isboolornot = false]
        B1 --> B2{isboolornot == true?}
        B2 -- Так --> B3[Друк 'Boolean is true']
        B2 -- Ні --> B4{isboolornot == false?}
        B4 -- Так --> B5[Друк 'Boolean is false']
    end

    Bools -->|Кінець| Cols[Виклик demonstrateCollections]

    subgraph Collections [demonstrateCollections]
        Cols --> C1[Створення List & додавання елемента]
        C1 --> C2[Створення Set унікальні значення & додавання]
    end

    Cols -->|Кінець| Nulls[Виклик demonstrateNullSafety]

    subgraph NullSafety [demonstrateNullSafety]
        Nulls --> NS1[Nullable int та String: int? b, String? hello]
        NS1 --> NS2[Безпечне звернення: hello?.length]
        NS2 --> NS3[Оператор злиття з null: username ?? 'Гость']
        NS3 --> NS4[Пізня ініціалізація: late String name]
    end

    Nulls --> End([Кінець програми])
```
---
## Завдання 2: Змінні, типи даних та функції
### 2.1. Змінні та типи даних (`task1_variables.dart`)

* **Опис:** Був заповнений файл `bin/task1_variables.dart`, що демонструє роботу зі змінними.
* **Інструкція:** Відкрити файл `task1_variables.dart`, відкрити термінал, ввести `dart run bin/task1_variables.dart`. Подивитися консоль.
```mermaid
    Start([Старт: main]) --> M1[Виклик calculateSum 10, 20]

    subgraph CalcSum [calculateSum]
        M1 --> CS1[Друкує суму a + b та повертає її]
    end

    M1 --> M2[Виклик calculateAverage 10.0, 20.0, 30.0, 40.0]

    subgraph CalcAvg [calculateAverage]
        M2 --> CA1[Рахує суму елементів у циклі]
        CA1 --> CA2[Ділить на довжину списку]
        CA2 --> CA3[Друкує та повертає середнє значення]
    end

    M2 --> M3[Виклик formatName: Іван, Петренко]

    subgraph FormatName [formatName]
        M3 --> FN1[Формує список parts: прізвище, ім'я]
        FN1 --> FN2{middleName є?}
        FN2 -- Так --> FN3[Додає middleName до parts]
        FN2 -- Ні / Після --> FN4[Об'єднує через пробіл]
        FN4 --> FN5{uppercase == true?}
        FN5 -- Так --> FN6[Переводить у UPPERCASE]
        FN5 -- Ні / Після --> FN7[Повертає рядок]
    end

    M3 --> M4[Виклик formatName з middleName та uppercase]
    M4 --> M5[Виклик testFunctionalProgramming]

    subgraph FuncProg [testFunctionalProgramming]
        M5 --> FP1[Вкладена функція calculate додавання/множення]
        FP1 --> FP2[Колекції: where, map, fold]
        FP2 --> FP3[Замикання Closure: makeAdder]
    end

    M5 --> M6[Виклик factorial 4]

    subgraph FactFib [factorial та fibonacci]
        M6 --> F1[Рахує факторіал у циклі від 1 до n]
        F1 --> F2[Передає результат у fibonacci]
        F2 --> F3[Виконує формулу n-1 + n-2 та повертає значення]
    end

    FactFib --> End([Кінець програми])
