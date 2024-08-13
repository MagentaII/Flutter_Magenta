import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_search_record_event.dart';
part 'weather_search_record_state.dart';

class WeatherSearchRecordBloc extends Bloc<WeatherSearchRecordEvent, WeatherSearchRecordState> {
  WeatherSearchRecordBloc() : super(WeatherSearchRecordInitial()) {
    on<WeatherSearchRecordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
