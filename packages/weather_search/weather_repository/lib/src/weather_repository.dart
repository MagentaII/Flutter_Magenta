import 'package:open_meteo_api/weather_api_client.dart' hide Weather;
import 'models/models.dart';

class WeatherRepository {
  final WeatherApiClient _client;

  WeatherRepository({
    WeatherApiClient? client,
  }) : _client = client ?? WeatherApiClient();

  Future<Weather> getWeather(String query) async {
    final location = await _client.locationSearch(query);
    final weather = await _client.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );
    return Weather.fromClient(weather: weather, location: location);
  }
}
