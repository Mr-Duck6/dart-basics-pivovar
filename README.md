Практична робота 4: Основи мови Dart

Завдання 1: Налаштування проекту та основи
синтаксису.

Опис: була створена структура проекту, яка містить:
![alt text](image.png)

README.md - опис завдань, інструкції.
pubspec.yaml - технічне налаштування проекту.
bin - містить завдання 1-5.
task1_variables.dart - завдання 1.
task2_functions.dart - завдання 2.
task3_classes.dart - завдання 3.
task4_collections.dart - завдання 4.
task5_async.dart - завдання 5.
lib - містить папку models.
models - містить файли з класами.
student.dart - клас студента.
course.dart - клас курсів.
university.dart - клас університету (також містить клас професора, та базовий клас людини).
utils - містить у собі програми.
calculator.dart - програма калькулятор.
data_processor.dart - тестування data processor.
test - містить тести.
models_test.dart - тест 1.
utils_test.dart - тест 2.

Завдання 2: Змінні, типи даних та функції

Опис: був заповнений файл // bin/task1_variables.dart, що демонструє роботу зі змінними.
Інструкція: відкрити файл task1_variables.dart, відкрити термінал, ввести dart run bin/task1_variables.dart. Подивитися консоль.

Блоксхема:
graph TD
%% Головна точка входу
Start([Старт: main]) --> Nums[Виклик demonstrateNumbers]

    %% Блок Numbers
    subgraph Numbers [demonstrateNumbers]
        Nums --> N1[Ініціалізація int = 5, double = 5.5]
        N1 --> N2[Математичні операції & print]
        N2 --> N3[Конвертація типів & print]
        N3 --> N4{Intvariable is int?}
        N4 -- Так --> N5[Друк 'Int']
        N4 -- Ні --> N6[Друк 'double']
    end

    Nums -->|Кінець| Strs[Виклик demonstrateStrings]

    %% Блок Strings
    subgraph Strings [demonstrateStrings]
        Strs --> S1[Ініціалізація рядків]
        S1 --> S2[Інтерполяція та конкатенація]
        S2 --> S3[Методи: isEmpty, length, toUpperCase...]
        S3 --> S4[Пошук підрядка: contains, indexOf...]
        S4 --> S5[Підрядок: substring]
    end

    Strs -->|Кінець| Bools[Виклик demonstrateBooleans]

    %% Блок Booleans
    subgraph Booleans [demonstrateBooleans]
        Bools --> B1[Ініціалізація integer1 та isboolornot = false]
        B1 --> B2{isboolornot == true?}
        B2 -- Так --> B3[Друк 'Boolean is true']
        B2 -- Ні --> B4{isboolornot == false?}
        B4 -- Так --> B5[Друк 'Boolean is false']
    end

    Bools -->|Кінець| Cols[Виклик demonstrateCollections]

    %% Блок Collections
    subgraph Collections [demonstrateCollections]
        Cols --> C1[Створення List & додавання елемента]
        C1 --> C2[Створення Set (унікальні значення) & додавання]
    end

    Cols -->|Кінець| Nulls[Виклик demonstrateNullSafety]

    %% Блок Null Safety
    subgraph NullSafety [demonstrateNullSafety]
        Nulls --> NS1[Nullable int та String: int? b, String? hello]
        NS1 --> NS2[Безпечне звернення: hello?.length]
        NS2 --> NS3[Оператор злиття з null: username ?? 'Гость']
        NS3 --> NS4[Пізня ініціалізація: late String name]
    end

    Nulls -->|Кінець| End([Кінець програми])