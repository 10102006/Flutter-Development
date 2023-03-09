import 'package:isar/isar.dart';

part 'student.g.dart';

@collection
class Student {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  late String name;

  late int age;
}

