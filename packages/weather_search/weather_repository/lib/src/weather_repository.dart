import 'package:weather_api_client/weather_api_client.dart' hide Weather;
import 'package:weather_local_storage/weather_local_storage.dart'
    hide SearchRecord;
import 'models/models.dart';
import 'package:weather_local_storage/weather_local_storage.dart'
    as weather_local_storage;

class WeatherRepository {
  final WeatherApiClient _client;
  final WeatherLocalStorage _localStorage;

  WeatherRepository({
    WeatherApiClient? client,
    WeatherLocalStorage? localStorage,
  })  : _client = client ?? WeatherApiClient(),
        _localStorage = localStorage ?? WeatherLocalStorage();

  /// API ======================================================================
  Future<Weather> getWeather(String query) async {
    final location = await _client.locationSearch(query);
    final weather = await _client.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );
    return Weather.fromClient(weather: weather, location: location);
  }
  // ===========================================================================


  /// SQL ======================================================================
  Future<void> saveSearchRecord(SearchRecord searchRecord) async {
    await _localStorage.saveSearchRecord(searchRecord.toLocalStorage());
  }

  Future<List<SearchRecord>> getAllSearchRecord() async {
    List<weather_local_storage.SearchRecord> searchRecords =
        await _localStorage.getAllSearchRecord();
    return searchRecords.map((s) => SearchRecord.fromLocalStorage(s)).toList();
  }

  Future<void> deleteAllSearchRecord() async {
    return _localStorage.deleteAllSearchRecord();
  }

  Future<void> deleteSearchRecordById(int id) async {
    return _localStorage.deleteSearchRecordById(id);
  }
  // ===========================================================================
}
