import 'student.dart';
import 'course.dart';

abstract class Person {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  String get fullName;
  int get age;
  String get role;
}

class Professor extends Person {
  final String department;
  final List<String> taughtCourses;
  final double salary;

  Professor({
    required String id,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
    required this.department,
    required this.salary,
    List<String>? taughtCourses,
  }) : taughtCourses = taughtCourses ?? [],
       super(
         id: id,
         firstName: firstName,
         lastName: lastName,
         birthDate: birthDate,
       );

  @override
  String get fullName => '$firstName $lastName';

  @override
  int get age => DateTime.now().year - birthDate.year;

  @override
  String get role => 'Professor';
}

class University {
  final String name;
  final List<Student> students;
  final List<Professor> professors;
  final List<Course> courses;

  University({
    required this.name,
    List<Student>? students,
    List<Professor>? professors,
    List<Course>? courses,
  }) : students = students ?? [],
       professors = professors ?? [],
       courses = courses ?? [];

  void addStudent(Student student) {
    if (!students.contains(student)) {
      students.add(student);
    }
  }

  void removeStudent(String studentId) {
    students.removeWhere((student) => student.id == studentId);
  }

  Student? findStudentById(String id) {
    for (final student in students) {
      if (student.id == id) {
        return student;
      }
    }

    return null;
  }

  List<Student> getStudentsByCourse(String courseId) {
    return students
        .where((student) => student.enrolledCourses.contains(courseId))
        .toList();
  }

  List<Course> getAvailableCoursesForStudent(String studentId) {
    final student = findStudentById(studentId);

    if (student == null) {
      return [];
    }

    return courses.where((course) {
      final canEnroll = course.canStudentEnroll(student);
      final notEnrolled = !student.enrolledCourses.contains(course.id);

      return canEnroll && notEnrolled;
    }).toList();
  }

  Map<String, dynamic> generateStatistics() {
    return {
      'totalStudents': students.length,
      'totalProfessors': professors.length,
      'totalCourses': courses.length,
    };
  }
}
