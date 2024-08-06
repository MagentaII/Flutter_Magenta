part of 'github_search_bloc.dart';

// GithubSearchStatus :
// {SearchStateEmpty, SearchStateLoading, SearchStateSuccess, SearchStateError}

sealed class GithubSearchState extends Equatable {
  const GithubSearchState();

  @override
  List<Object> get props => [];
}

// GithubSearchInitial
final class SearchStateEmpty extends GithubSearchState {}

final class SearchStateLoading extends GithubSearchState {}

final class SearchStateSuccess extends GithubSearchState {
  final List<RepositoryResultItem> items;

  const SearchStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() {
    return 'SearchStateSuccess { items: ${items.length} }';
  }
}

final class SearchStateError extends GithubSearchState {
  final String error;

  const SearchStateError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'SearchStateError { error message: $error }';
  }
}
