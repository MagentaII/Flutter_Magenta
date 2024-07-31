import 'package:equatable/equatable.dart';
import 'package:open_meteo_api/weather_api_client.dart' as weather_api_client;

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}

class Weather extends Equatable {
  final String location;
  final Temperature temperature;
  final WeatherCondition condition;
  final DateTime lastUpdate;

  Weather({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.lastUpdate,
  });

  @override
  List<Object> get props => [location, temperature, condition];

  factory Weather.fromClient({
    required weather_api_client.Weather weather,
    required weather_api_client.Location location,
  }) {
    return Weather(
      location: location.name,
      temperature: Temperature(value: weather.temperature),
      condition: weather.weathercode.toInt().toCondition,
      lastUpdate: DateTime.now(),
    );
  }
}

class Temperature extends Equatable {
  final double value;

  Temperature({
    required this.value,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      value: json['value'] as double,
    );
  }

  @override
  List<Object> get props => [value];
}

extension on int {
  WeatherCondition get toCondition {
    switch (this) {
      case 0:
        return WeatherCondition.clear;
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return WeatherCondition.cloudy;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return WeatherCondition.rainy;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
