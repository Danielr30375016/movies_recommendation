import 'package:equatable/equatable.dart';

import 'package:movies_recommendation/domain/models/user.dart';

class MoviesState extends Equatable {
  final bool isLoading;
  final User? user;

  const MoviesState({
    this.isLoading = true,
    this.user,
  });

  @override
  List<Object?> get props => [
        isLoading,
        user,
      ];

  MoviesState copyWith({
    bool? isLoading,
    User? user,
  }) {
    return MoviesState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}
