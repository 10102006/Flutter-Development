import 'package:isar/isar.dart';
import 'student.dart';

class IsarServices {
  late Future<Isar> db;

  IsarServices() {
    db = openDB();
  }

  Future<void> saveStudent(Student newStudent) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.students.put(newStudent); // insert & update
    });
  }

  Future<Isar> openDB() async {
    // Making a database
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([StudentSchema], inspector: true);
    }

    return Future.value(Isar.getInstance());
  }
}
