import 'package:bloc/bloc.dart';

import 'package:movies_recommendation/domain/models/user.dart';
import 'package:movies_recommendation/ui/movies/movies_state.dart';

class MoviesBloc extends Cubit<MoviesState> {
  User user;
  MoviesBloc(
    this.user,
  ) : super(const MoviesState());

  Future<void> getFirstState() async {
    emit(state.copyWith(isLoading: false, user: user));
  }
}
