import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_recommendation/ui/movies/movies_bloc.dart';
import 'package:movies_recommendation/ui/movies/movies_state.dart';
import 'package:movies_recommendation/utils/constants.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final MoviesBloc _moviesBloc = GetIt.I<MoviesBloc>();

  @override
  void initState() {
    _moviesBloc.getFirstState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue,
      body: BlocBuilder<MoviesBloc, MoviesState>(
          bloc: _moviesBloc,
          builder: (context, state) {
            return Center(
              child: InkWell(
                onTap: () {
                  // context.go(AppConstants.animesScreen);
                  context.go(AppConstants.astronomyPicturesScreen);
                },
                child: Text(state.user?.firstName ?? ''),
              ),
            );
          }),
    ));
  }
}
