import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initDb(String filePath) async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  final path = join(documentsDirectory.path, filePath);

  return await openDatabase(path, version: 1, onCreate: _createDB);
}

Future<void> _createDB(db, version) async {
  log("Building db");
  return await db.execute('''
        CREATE TABLE recipes(id TEXT PRIMARY KEY, title TEXT);
        CREATE TABLE sections(
          id TEXT PRIMARY KEY,
          title TEXT,
          content TEXT,
          recipe_id TEXT FOREIGN KEY,
          type INTEGER,
          order INTEGER,
          FOREIGN KEY(recipe_id) REFERENCES recipes(id)
        );
      ''');
}
