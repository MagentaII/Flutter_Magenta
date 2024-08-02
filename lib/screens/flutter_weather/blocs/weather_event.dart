part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

final class LocationChanged extends WeatherEvent {
  final String _query;

  const LocationChanged({
    String? query,
  }) : _query = query ?? '';

  @override
  List<Object> get props => [_query];

  @override
  String toString() {
    return 'LocationChanged { City Location : $_query }';
  }
}

final class RefreshWeather extends WeatherEvent {
  final Weather weather;

  const RefreshWeather({
    required this.weather,
  });

  @override
  List<Object> get props => [weather];

  @override
  String toString() {
    return 'LocationChanged { Weather : $weather }';
  }
}
