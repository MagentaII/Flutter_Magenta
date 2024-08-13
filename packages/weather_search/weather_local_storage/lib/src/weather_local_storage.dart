import 'package:weather_local_storage/src/database/database.dart';
import 'package:weather_local_storage/src/models/models.dart';

class WeatherLocalStorage {
  final WeatherDatabase database = WeatherDatabase.instance;

  // Save search record
  Future<void> saveSearchRecord(SearchRecord searchRecord) async {
    await database.insert(searchRecord.toMap());
  }

  // Get all search record
  Future<List<SearchRecord>> getAllSearchRecord() async {
    List<Map<String, Object?>> searchRecords = await database.getAll();
    return searchRecords.map((map) => SearchRecord.fromMap(map)).toList();
  }

  // Delete all search record
  Future<void> deleteAllSearchRecord() async {
    await database.deleteAll();
  }

  // Delete search record by id
  Future<void> deleteSearchRecordById(int id) async {
    await database.deleteById(id);
  }
}
