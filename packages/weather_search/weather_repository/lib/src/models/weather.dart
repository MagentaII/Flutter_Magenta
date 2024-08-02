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
  final double temperature;
  final WeatherCondition condition;

  Weather({
    required this.location,
    required this.temperature,
    required this.condition,
  });

  @override
  List<Object?> get props => [location, temperature, condition];

  factory Weather.fromClient({
    required weather_api_client.Weather weather,
    required weather_api_client.Location location,
  }) {
    return Weather(
      location: location.name,
      temperature: weather.temperature,
      condition: weather.weathercode.toInt().toCondition
    );
  }
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
