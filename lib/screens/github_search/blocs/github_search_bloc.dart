import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_repository/github_repository.dart';

part 'github_search_event.dart';

part 'github_search_state.dart';

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  final GithubRepository repository;

  GithubSearchBloc({required this.repository}) : super(SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged);
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
