part of 'weather_search_record_bloc.dart';

sealed class WeatherSearchRecordState extends Equatable {
  const WeatherSearchRecordState();
}

final class WeatherSearchRecordInitial extends WeatherSearchRecordState {
  @override
  List<Object> get props => [];
}
