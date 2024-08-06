part of 'github_detail_bloc.dart';

sealed class GithubDetailEvent extends Equatable {
  const GithubDetailEvent();
}

final class OnRepoTapped extends GithubDetailEvent {
  final String fullName;

  const OnRepoTapped({
    required this.fullName,
  });

  @override
  List<Object> get props => [fullName];

  @override
  String toString() {
    return 'OnRepoTapped { Full Name: $fullName }';
  }
}
