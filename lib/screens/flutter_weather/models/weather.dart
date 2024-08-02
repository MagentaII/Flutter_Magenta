import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

enum TemperatureUnits {
  fahrenheit,
  celsius,
}

extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

class Weather extends Equatable {
  final WeatherCondition condition;
  final DateTime lastUpdated;
  final String location;
  final Temperature temperature;

  const Weather({
    required this.condition,
    required this.lastUpdated,
    required this.location,
    required this.temperature,
  });

  @override
  List<Object> get props => [condition, lastUpdated, location, temperature];

  @override
  String toString() {
    return 'Weather { WeatherCondition : $condition, DateTime : $lastUpdated, Location : $location, Temperature: $temperature }';
  }

  factory Weather.fromRepository(weather_repository.Weather weather) {
    return Weather(
      condition: weather.condition,
      lastUpdated: DateTime.now(),
      location: weather.location,
      temperature: Temperature(
        value: weather.temperature,
        units: TemperatureUnits.celsius,
      ),
    );
  }

  static final empty = Weather(
    condition: WeatherCondition.unknown,
    lastUpdated: DateTime(0),
    location: '--',
    temperature: const Temperature(
      value: 0,
      units: TemperatureUnits.celsius,
    ),
  );

  Weather copyWith({
    WeatherCondition? condition,
    DateTime? lastUpdated,
    String? location,
    Temperature? temperature,
    TemperatureUnits? units,
  }) {
    return Weather(
      condition: condition ?? this.condition,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
    );
  }
}

class Temperature extends Equatable {
  final double value;
  final TemperatureUnits units;

  const Temperature({
    required this.value,
    required this.units,
  });

  @override
  List<Object> get props => [value, units];

  Temperature copyWith({
    double? value,
    TemperatureUnits? units,
  }) {
    return Temperature(
      value: value ?? this.value,
      units: units ?? this.units,
    );
  }
}
