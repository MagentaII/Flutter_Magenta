import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';

class WeatherApiClient {
  static const _baseUrlWeather = 'api.open-meteo.com';
  static const _baseUrlGeocoding = 'geocoding-api.open-meteo.com';

  final http.Client _httpClient;

  WeatherApiClient({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Finds a [Location] `/v1/search/?name={query}&count=1`.
  Future<Location> locationSearch(String query) async {
    final locationRequest = Uri.https(
      _baseUrlGeocoding,
      '/v1/search',
      {'name': query, 'count': '1'},
    );

    final locationResponse = await _httpClient.get(locationRequest);

    if (locationResponse.statusCode != 200) {
      throw LocationRequestFailure();
    }

    final locationJson =
        json.decode(locationResponse.body) as Map<String, dynamic>;

    if (!locationJson.containsKey('results')) throw LocationNotFoundFailure();

    final results = locationJson['results'] as List;

    if (results.isEmpty) throw LocationNotFoundFailure();

    return Location.fromJson(results.first as Map<String, dynamic>);
  }

  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final weatherRequest = Uri.https(
      _baseUrlWeather,
      'v1/forecast',
      {
        'latitude': '$latitude',
        'longitude': '$longitude',
        'current_weather': 'true',
      },
    );

    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) throw WeatherRequestFailure();

    final weatherJson =
        json.decode(weatherResponse.body) as Map<String, dynamic>;

    if (!weatherJson.containsKey('current_weather')) {
      throw WeatherNotFoundFailure();
    }

    final currentWeatherJson =
        weatherJson['current_weather'] as Map<String, dynamic>;

    return Weather.fromJson(currentWeatherJson);
  }
}

/// Exception thrown when locationSearch fails.
class LocationRequestFailure implements Exception {}

/// Exception thrown when the provided location is not found.
class LocationNotFoundFailure implements Exception {}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}
