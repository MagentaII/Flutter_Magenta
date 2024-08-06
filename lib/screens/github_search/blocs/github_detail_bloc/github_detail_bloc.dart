import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_repository/github_repository.dart';

part 'github_detail_event.dart';

part 'github_detail_state.dart';

class GithubDetailBloc extends Bloc<GithubDetailEvent, GithubDetailState> {
  final GithubRepository repository;

  GithubDetailBloc({required this.repository}) : super(DetailStateEmpty()) {
    on<OnRepoTapped>(_onRepoTapped);
  }

  Future<void> _onRepoTapped(
    OnRepoTapped event,
    Emitter<GithubDetailState> emit,
  ) async {
    if (event.fullName.isEmpty) {
      emit(DetailStateEmpty());
    }

    emit(DetailStateLoading());

    try {
      final detail = await repository.getRepositoryDetail(event.fullName);
      emit(DetailStateSuccess(detail));
    } catch (error) {
      emit(error is RepositoryError
          ? DetailStateError(error.message)
          : const DetailStateError('something went wrong'));
    }
  }
}
