import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import '../../models/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({required this.repository})
      : super(WeatherStateInitial(weather: Weather.empty)) {
    on<LocationChanged>(_onLocationChanged);
    on<RefreshWeather>(_onRefreshWeather);
    on<ToggleUnits>(_onToggleUnits);
  }

  Future<void> _onLocationChanged(
    LocationChanged event,
    Emitter<WeatherState> emit,
  ) async {
    if (event._query.isEmpty) return;

    final nowWeather = state.weather;

    emit(WeatherStateLoading(weather: nowWeather));

    try {
      final newWeather = Weather.fromRepository(
        await repository.getWeather(event._query),
      );

      log('WeatherBloc : ${newWeather.toString()}');

      final TemperatureUnits units;

      if (nowWeather != Weather.empty) {
        units = nowWeather.temperature.units;
      } else {
        units = newWeather.temperature.units;
      }

      final value = units.isFahrenheit
          ? newWeather.temperature.value.toFahrenheit()
          : newWeather.temperature.value;

      emit(
        WeatherStateSuccess(
          weather: newWeather.copyWith(
            temperature: newWeather.temperature.copyWith(
              units: units,
              value: value,
            ),
          ),
        ),
      );
    } on Exception {
      emit(WeatherStateFailure(weather: Weather.empty));
    }
  }

  Future<void> _onRefreshWeather(
    RefreshWeather event,
    Emitter<WeatherState> emit,
  ) async {
    if (event.weather == Weather.empty) return;

    final nowWeather = event.weather;

    try {
      final newWeather = Weather.fromRepository(
        await repository.getWeather(event.weather.location),
      );
      final units = nowWeather.temperature.units;
      final value = units.isFahrenheit
          ? newWeather.temperature.value.toFahrenheit()
          : newWeather.temperature.value;

      emit(
        WeatherStateSuccess(
          weather: newWeather.copyWith(
            temperature: state.weather.temperature.copyWith(
              units: units,
              value: value,
            ),
          ),
        ),
      );
    } on Exception {
      emit(WeatherStateSuccess(weather: nowWeather));
    }
  }

  void _onToggleUnits(
    ToggleUnits event,
    Emitter<WeatherState> emit,
  ) {
    final nowWeather = event.weather;

    final units = nowWeather.temperature.units.isFahrenheit
        ? TemperatureUnits.celsius
        : TemperatureUnits.fahrenheit;

    // Create a new Weather object with updated temperature units
    final updatedWeather = nowWeather.copyWith(
      temperature: nowWeather.temperature.copyWith(
        units: units,
      ),
    );

    // Emit the current state with updated weather, except for WeatherStateSuccess
    if (state is WeatherStateInitial ||
        state is WeatherStateLoading ||
        state is WeatherStateFailure) {
      emit(
        state is WeatherStateInitial
            ? WeatherStateInitial(weather: updatedWeather)
            : state is WeatherStateLoading
                ? WeatherStateLoading(weather: updatedWeather)
                : WeatherStateFailure(weather: updatedWeather),
      );
    }

    if (nowWeather != Weather.empty && state is WeatherStateSuccess) {
      final value = nowWeather.temperature.value;
      emit(
        WeatherStateSuccess(
          weather: nowWeather.copyWith(
            temperature: nowWeather.temperature.copyWith(
              units: units,
              value:
                  units.isFahrenheit ? value.toFahrenheit() : value.toCelsius(),
            ),
          ),
        ),
      );
    }
  }
}

extension on double {
  double toFahrenheit() => (this * 9 / 5) + 32;

  double toCelsius() => (this - 32) * 5 / 9;
}
