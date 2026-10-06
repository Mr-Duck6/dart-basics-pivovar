import 'package:dart_basics_pivovar/models/university.dart';
import 'package:dart_basics_pivovar/models/student.dart';
import 'package:dart_basics_pivovar/models/course.dart';

void main() {
  final university1 = University(name: 'KPI');

  final professor1 = Professor(
    id: '1',
    firstName: 'Ivan',
    lastName: 'Stukovich',
    birthDate: DateTime(1985, 5, 15),
    department: 'Math teacher',
    salary: 40000,
  );

  final student1 = Student(
    id: '1',
    firstName: 'Sasha',
    lastName: 'Rovich',
    birthDate: DateTime(2008, 05, 01),
  );

  final student2 = Student(
    id: '2',
    firstName: 'Kirril',
    lastName: 'Sovikal',
    birthDate: DateTime(2006, 10, 08),
  );

  final course1 = Course(
    id: '1',
    name: 'Math',
    description: 'Basic math',
    credits: 3444,
    instructor: 'Ivan',
  );

  university1.addStudent(student1);
  university1.addStudent(student2);

  university1.professors.add(professor1);
  university1.courses.add(course1);

  student2.enrollInCourse(course1.id);
  student2.addGrade(course1.id, 50.5);

  runUniversityDemo(university1, course1);
}

void runUniversityDemo(University university, Course course) {
  final studentsOnCourse = university.getStudentsByCourse(course.id);
  print('${course.name}: ${studentsOnCourse.length}');
  print('${university.generateStatistics()}');
}
