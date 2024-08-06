part of 'github_detail_bloc.dart';

sealed class GithubDetailState extends Equatable {
  const GithubDetailState();

  @override
  List<Object> get props => [];
}

// GithubDetailInitial
final class DetailStateEmpty extends GithubDetailState {}

final class DetailStateLoading extends GithubDetailState {}

final class DetailStateSuccess extends GithubDetailState {
  final RepositoryDetail detail ;

  const DetailStateSuccess(this.detail);

  @override
  List<Object> get props => [detail];

  @override
  String toString() {
    return 'DetailStateSuccess { Repository Detail: $detail }';
  }
}

final class DetailStateError extends GithubDetailState {
  final String error;

  const DetailStateError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'DetailStateError { error message: $error }';
  }
}
