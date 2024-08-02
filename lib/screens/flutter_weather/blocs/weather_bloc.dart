import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import '../models/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(WeatherStateInitial()) {
    on<LocationChanged>(_onLocationChanged);
    on<RefreshWeather>(_onRefreshWeather);
  }

  Future<void> _onLocationChanged(
    LocationChanged event,
    Emitter<WeatherState> emit,
  ) async {
    if (event._query.isEmpty) return;

    emit(WeatherStateLoading());

    try {
      final weather = Weather.fromRepository(
        await repository.getWeather(event._query),
      );
      print('WeatherBloc : ${weather.toString()}');
      final units = weather.temperature.units;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;

      emit(
        WeatherStateSuccess(
          weather: weather.copyWith(
            temperature: weather.temperature.copyWith(
              value: value,
              units: units,
            ),
          ),
        ),
      );
    } on Exception {
      emit(WeatherStateFailure());
    }
  }

  Future<void> _onRefreshWeather(
    RefreshWeather event,
    Emitter<WeatherState> emit,
  ) async {
    if (event.weather == Weather.empty) return;

    try {
      final weather = Weather.fromRepository(
        await repository.getWeather(event.weather.location),
      );
      final units = weather.temperature.units;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;

      emit(
        WeatherStateSuccess(
          weather: weather.copyWith(
            temperature: weather.temperature.copyWith(
              value: value,
              units: units,
            ),
          ),
        ),
      );
    } on Exception {
      return;
    }
  }
}

extension on double {
  double toFahrenheit() => (this * 9 / 5) + 32;
  double toCelsius() => (this - 32) * 5 / 9;
}
