part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  final Weather weather;

  const WeatherState({
    required this.weather,
  });

  @override
  List<Object> get props => [weather];
}

/// WeatherInitial
final class WeatherStateInitial extends WeatherState {
  // final Weather weather;
  const WeatherStateInitial({required super.weather});

  @override
  String toString() {
    return 'WeatherStateInitial { Weather : $weather }';
  }
}

final class WeatherStateLoading extends WeatherState {
  const WeatherStateLoading({required super.weather});

  @override
  String toString() {
    return 'WeatherStateLoading { Weather : $weather }';
  }
}

final class WeatherStateFailure extends WeatherState {
  const WeatherStateFailure({required super.weather});

  @override
  String toString() {
    return 'WeatherStateFailure { Weather : $weather }';
  }
}

final class WeatherStateSuccess extends WeatherState {
  // final Weather weather;

  const WeatherStateSuccess({required super.weather});

  @override
  String toString() {
    return 'WeatherStateSuccess { Weather : $weather }';
  }
}
