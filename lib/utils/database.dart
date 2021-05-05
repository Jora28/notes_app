import 'package:exam_cheack_box/utils/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._internal();
  static final DBProvider db = DBProvider._internal();
  Database _database;
  String expensesTable = 'expenses_table';

  String id = 'id';
  String name;
  String amount;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
        join(
          await getDatabasesPath(),
          "checkbox.db",
        ), onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE Cheackbox(
        id TEXT PRIMARYKEY,
        title TEXT,
        description TEXT)
        ''');
    }, version: 1);
  }

  newInput(Input input) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO Cheackbox(title, description) VALUES(?,?)',
          [input.title, input.description]);
    });
  }

  Future<List<Input>> getInputs() async {
    final db = await database;
    var res = await db.query('Cheackbox');
    if (res.length == 0) {
      return null;
    } else {
      return res.map((e) {
        return Input.fromJson(e);
      }).toList();
    }
  }

  Future<void> delete(String id) async {
    final db = await database;
    await db.delete('Cheackbox', where: 'title = ?', whereArgs: [id]);
  }
}
