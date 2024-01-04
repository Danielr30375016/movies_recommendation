import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_recommendation/domain/models/astronomy_pictures_model.dart';
import 'package:movies_recommendation/domain/repository/comics_repository.dart';
import 'package:movies_recommendation/ui/nasa/astronomy_pictures/astronomy_pictures_state.dart';

class AstronomyPicturesBloc extends Cubit<AstronomyPicturesState> {
  final ComicsRepository _comicsRepository = GetIt.I<ComicsRepository>();
  AstronomyPicturesBloc() : super(AstronomyPicturesState());

  Future<void> getFirstState() async {
    final List<AstronomyPicturesModel> astronomyImages =
        await _comicsRepository.getAstronomyPictures();
    emit(state.copyWith(isLoading: false, astronomyImages: astronomyImages));
  }

  Future<void> startPeriodicFunction(int numMilliseconds) async {
    Timer.periodic(Duration(milliseconds: numMilliseconds), (timer) {
      List<Color> colorGradients = List.from(state.colorGradient);
      Color colorGradient = colorGradients.removeLast();
      colorGradients.insert(0, colorGradient);
      emit(state.copyWith(aux: !state.aux, colorGradient: colorGradients));
    });
  }
}
