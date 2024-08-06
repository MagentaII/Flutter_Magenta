import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'github_search_event.dart';

part 'github_search_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  final GithubRepository repository;

  GithubSearchBloc({required this.repository}) : super(SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  Future<void> _onTextChanged(
    TextChanged event,
    Emitter<GithubSearchState> emit,
  ) async {
    if (event.text.isEmpty) {
      return emit(SearchStateEmpty());
    }

    emit(SearchStateLoading());

    try {
      final result = await repository.githubRepositorySearch(event.text);
      emit(SearchStateSuccess(result.items));
    } catch (error) {
      emit(error is RepositorySearchError
          ? SearchStateError(error.message)
          : const SearchStateError('something went wrong'));
    }
  }
}
