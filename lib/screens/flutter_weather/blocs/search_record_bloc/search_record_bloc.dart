import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart';

part 'search_record_event.dart';

part 'search_record_state.dart';

class SearchRecordBloc extends Bloc<SearchRecordEvent, SearchRecordState> {
  final WeatherRepository repository;

  SearchRecordBloc({required this.repository})
      : super(SearchRecordStateInitial()) {
    on<AddSearchRecord>(_onAddSearchRecord);
    on<RemoveSearchRecord>(_onRemoveSearchRecord);
    on<ClearAllSearchRecords>(_onClearAllSearchRecords);
    on<LoadSearchRecords>(_onLoadSearchRecords);
  }

  Future<void> _onAddSearchRecord(
    AddSearchRecord event,
    Emitter<SearchRecordState> emit,
  ) async {
    emit(SearchRecordStateLoading());

    try {
      await repository.saveSearchRecord(event.record);
      final records = await repository.getAllSearchRecord();
      emit(SearchRecordStateLoaded(records: records));
    } catch (_) {
      emit(SearchRecordStateError());
    }
  }

  Future<void> _onRemoveSearchRecord(
    RemoveSearchRecord event,
    Emitter<SearchRecordState> emit,
  ) async {
    emit(SearchRecordStateLoading());
    try {
      await repository.deleteSearchRecordById(event.record.id!);

      final records = await repository.getAllSearchRecord();
      emit(SearchRecordStateLoaded(records: records));
    } catch (_) {
      emit(SearchRecordStateError());
    }
  }

  Future<void> _onClearAllSearchRecords(
    ClearAllSearchRecords event,
    Emitter<SearchRecordState> emit,
  ) async {
    emit(SearchRecordStateLoading());
    try {
      await repository.deleteAllSearchRecord();

      final records = await repository.getAllSearchRecord();
      emit(SearchRecordStateLoaded(records: records));
    } catch (_) {
      emit(SearchRecordStateError());
    }
  }

  Future<void> _onLoadSearchRecords(
    LoadSearchRecords event,
    Emitter<SearchRecordState> emit,
  ) async {
    emit(SearchRecordStateLoading());
    try {
      final records = await repository.getAllSearchRecord();
      emit(SearchRecordStateLoaded(records: records));
    } catch (_) {
      emit(SearchRecordStateError());
    }
  }
}
