import 'package:equatable/equatable.dart';

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
  List<Object> get props => [location, temperature, condition];

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['location'] as String,
      temperature: json['temperature'] as double,
      condition: json['condition'] as WeatherCondition,
    );
  }
}
