part of 'search_record_bloc.dart';

sealed class SearchRecordEvent extends Equatable {
  const SearchRecordEvent();
}

final class AddSearchRecord extends SearchRecordEvent {
  final SearchRecord record;

  const AddSearchRecord({
    required this.record,
  });

  @override
  List<Object> get props => [record];

  @override
  String toString() {
    return 'AddSearchRecord { Add City: $record }';
  }
}

final class RemoveSearchRecord extends SearchRecordEvent {
  final SearchRecord record;

  const RemoveSearchRecord({
    required this.record,
  });

  @override
  List<Object> get props => [record];

  @override
  String toString() {
    return 'RemoveSearchRecord { Remove City: $record }';
  }
}

final class ClearAllSearchRecords extends SearchRecordEvent {
  @override
  List<Object?> get props => [];
}

final class LoadSearchRecords extends SearchRecordEvent {
  @override
  List<Object?> get props => [];
}
