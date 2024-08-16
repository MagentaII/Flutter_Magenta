import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WeatherDatabase {
  /// Singleton pattern
  WeatherDatabase._();

  static final WeatherDatabase instance = WeatherDatabase._();

  static const _databaseName = 'WeatherDatabase.db';
  static const _databaseVersion = 1;

  static const table = 'search_records';
  static const columnId = 'id';
  static const columnCity = 'city';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), _databaseName),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE $table($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnCity TEXT NOT NULL UNIQUE)",
      );
    }, version: _databaseVersion);
  }

  /// Insert data
  Future<int> insert(Map<String, Object?> map) async {
    Database db = await WeatherDatabase.instance.database;
    return await db.insert(
      table,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Update data
  Future<int> update(Map<String, Object?> map) async {
    Database db = await WeatherDatabase.instance.database;
    int id = map['id'] as int;
    return await db.update(
      table,
      map,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  /// Delete data by id
  Future<int> deleteById(int id) async {
    Database db = await WeatherDatabase.instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  /// Delete all data
  Future<int> deleteAll() async {
    Database db = await WeatherDatabase.instance.database;
    return await db.delete(table);
  }

  /// Get all data
  Future<List<Map<String, Object?>>> getAll() async {
    Database db = await WeatherDatabase.instance.database;
    return await db.query(table);
  }

  /// Get data by id
  Future<List<Map<String, Object?>>> getById(int id) async {
    Database db = await WeatherDatabase.instance.database;
    return await db.query(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
