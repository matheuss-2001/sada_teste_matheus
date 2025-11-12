import 'package:path/path.dart';
import 'package:sada_teste_matheus/modules/occurrence/data/models/occurrence_viewmodel.dart';
import 'package:sqflite/sqflite.dart';

class OccurrenceDatabase {
  static Database? _database;
  static const String _tableName = 'occurrences';

  static Future<Database> get database async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'occurrences.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            plate TEXT,
            photo_bytes BLOB,
            responsible_name TEXT,
            responsible_sign_bytes BLOB,
            datetime_register_occurrence TEXT,
            datetime_register_signed TEXT
          )
        ''');
      },
    );

    return _database!;
  }

  static Future<int> saveOccurrenceOffline(OccurrenceViewmodel occurrence) async {
    final db = await database;
    return await db.insert(_tableName, occurrence.toJsonSaveData(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<OccurrenceViewmodel>> getListOccurrencesSaved() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(_tableName, orderBy: 'id DESC');
    return result.map((e) => OccurrenceViewmodel.fromJson(e)).toList();
  }

  static Future<void> clearDbOccurrencesOffline() async {
    final db = await database;
    await db.delete(_tableName);
  }
}
