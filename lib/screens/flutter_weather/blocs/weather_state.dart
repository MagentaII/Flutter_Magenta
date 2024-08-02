part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

/// WeatherInitial
final class WeatherStateInitial extends WeatherState {
  final Weather weather;

  WeatherStateInitial({
    Weather? weather,
  }) : weather = weather ?? Weather.empty;

  @override
  List<Object> get props => [weather];

  @override
  String toString() {
    return 'WeatherStateInitial { Weather : $weather }';
  }
}

final class WeatherStateLoading extends WeatherState {}

final class WeatherStateFailure extends WeatherState {}

final class WeatherStateSuccess extends WeatherState {
  final Weather weather;

  const WeatherStateSuccess({
    required this.weather,
  });

  @override
  List<Object> get props => [weather];

  @override
  String toString() {
    return 'WeatherStateSuccess { Weather : $weather }';
  }
}
