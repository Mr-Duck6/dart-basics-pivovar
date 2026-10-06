import 'dart:io';
import 'dart:convert';
import 'dart:js_interop';

import 'package:dart_basics_pivovar/models/student.dart';

void main() async {
  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}

Future<String> fetchStudentData(String studentId) async {
  await Future.delayed(Duration(seconds: 1));
  return '{"id": "$studentId", "name": "Студент №$studentId", "age": 20}';
}

Future<List<Student>> loadStudentsFromFile(String filename) async {
  final file = File(filename);
  if (!await file.exists()) {
    return [];
  }
  final contents = await file.readAsString();
  final List<dynamic> jsonList = jsonDecode(contents);
  return jsonList.map((json) => Student.fromJson(json)).toList();
}

Future<void> saveStudentsToFile(List<Student> students, String filename) async {
  final file = File(filename);
  final jsonList = students.map((s) => s.toJson()).toList();
  await file.writeAsString(jsonEncode(jsonList));
}

Stream<Student> studentStream() async* {
  final students = [
    Student(
      id: '1',
      firstName: 'Олександр',
      lastName: 'Петренко',
      birthDate: DateTime(2003, 3, 10),
      enrolledCourses: ['Dart'],
      grades: {'Dart': 95.0},
    ),
    Student(
      id: '2',
      firstName: 'Софія',
      lastName: 'Мельник',
      birthDate: DateTime(2005, 7, 22),
      enrolledCourses: ['Flutter'],
      grades: {'Flutter': 88.0},
    ),
    Student(
      id: '3',
      firstName: 'Максим',
      lastName: 'Шевченко',
      birthDate: DateTime(2004, 11, 5),
    ),
  ];

  for (var student in students) {
    await Future.delayed(Duration(milliseconds: 500));
    yield student;
  }
}

Future<void> demonstrateFutures() async {
  try {
    final results = await Future.wait([
      fetchStudentData('101'),
      fetchStudentData('102'),
    ]);
    print('Отримано дані через Future.wait:');
    for (var jsonStr in results) {
      final student = Student.fromJson(jsonDecode(jsonStr));
      print(' - ${student.fullName}, GPA: ${student.gpa}');
    }

    final timelyData = await fetchStudentData('103')
        .timeout(Duration(seconds: 2));
    final studentTimeout = Student.fromJson(jsonDecode(timelyData));
    print('Дані з timeout: ${studentTimeout.fullName}');
  } catch (e) {
    print('Сталася помилка або перевищено ліміт часу: $e');
  }
}

Future<void> demonstrateStreams() async {
  await for (var student in studentStream()) {
    print(
      'Отримано з потоку: ${student.fullName}, Вік: ${student.age}, GPA: ${student.gpa}',
    );
  }
}

Future<void> demonstrateFileOperations() async {
  const filename = 'students.json';

  final testStudents = [
    Student(
      id: 'A1',
      firstName: 'Ірина',
      lastName: 'Коваль',
      birthDate: DateTime(2002, 1, 12),
      enrolledCourses: ['UI/UX', 'Databases'],
      grades: {'UI/UX': 92.0, 'Databases': 78.5},
    ),
    Student(
      id: 'A2',
      firstName: 'Дмитро',
      lastName: 'Бойко',
      birthDate: DateTime(2004, 9, 3),
      enrolledCourses: ['Algorithms'],
      grades: {'Algorithms': 55.0},
    ),
  ];

  await saveStudentsToFile(testStudents, filename);
  print('Студентів успішно збережено у файл "$filename".');

  final loadedStudents = await loadStudentsFromFile(filename);
  print('Завантажено студентів з файлу: ${loadedStudents.length} шт.');
  for (var s in loadedStudents) {
    print(' • ${s.fullName} | Пройдені курси: ${s.getPassedCourses()}');
  }
}
