part of 'search_record_bloc.dart';

sealed class SearchRecordState extends Equatable {
  const SearchRecordState();
}

final class SearchRecordStateInitial extends SearchRecordState {
  @override
  List<Object> get props => [];
}

final class SearchRecordStateLoading extends SearchRecordState {
  @override
  List<Object> get props => [];
}

final class SearchRecordStateError extends SearchRecordState {
  @override
  List<Object> get props => [];
}

final class SearchRecordStateLoaded extends SearchRecordState {
  final List<SearchRecord> records;

  const SearchRecordStateLoaded({
    required this.records,
  });

  @override
  List<Object> get props => [records];

  @override
  String toString() {
    return 'SearchRecordStateLoaded { Search Record $records }';
  }
}

final class SearchRecordStateUpdated extends SearchRecordState {
  @override
  List<Object> get props => [];
}

final class SearchRecordStateCleared extends SearchRecordState {
  @override
  List<Object> get props => [];
}
