import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_recommendation/ui/main_content/main_content_state.dart';

class MainContentBloc extends Cubit<MainContentState> {
  MainContentBloc() : super(MainContentState());

  Future<void> startPeriodicFunction(int numMilliseconds) async {
    Timer.periodic(Duration(milliseconds: numMilliseconds), (timer) {
      List<Color> colorGradients = List.from(state.colorGradient);
      Color colorGradient = colorGradients.removeLast();
      colorGradients.insert(0, colorGradient);
      emit(state.copyWith(aux: !state.aux, colorGradient: colorGradients));
    });
  }
}
