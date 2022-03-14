import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper_ui {
  var _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db;
    }
    _db = openDatabase(
      join(await getDatabasesPath(), 'userInfo.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY, theater TEXT, time INTEGER, movieNm TEXT)",
        );
      },
      version: 1,
    );
    return _db;
  }

  Future<void> insertData(User user) async {
    final Database db = await database;

    await db.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> user() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user');

    return List.generate(maps.length, (i) {
      return User(
        maps[i]['id'],
        maps[i]['theater'],
        maps[i]['time'],
        maps[i]['movieNm'],
      );
    });
  }

  Future<void> updateData(User user) async {
    final db = await database;

    await db
        .update('user', user.toMap(), where: "id = ?", whereArgs: [user.id]);
  }

  Future<void> deleteData(int id) async {
    final db = await database;
    await db.delete('user', where: "id = ?", whereArgs: [id]);
  }
}

class User {
  final int id;
  final String theater;
  final int time;
  final String movieNm;

  User(this.id, this.theater, this.time, this.movieNm);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'theater': theater,
      'time': time,
      'movieNm': movieNm,
    };
  }

  // 각 dog 정보를 보기 쉽도록 print 문을 사용하여 toString을 구현하세요
  @override
  String toString() {
    return 'User{id: $id, theater:$theater, time:$time, movieNm:$movieNm}';
  }
}
