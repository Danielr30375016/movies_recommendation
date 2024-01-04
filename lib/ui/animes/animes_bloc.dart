import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_recommendation/domain/models/comic.dart';

import 'package:movies_recommendation/domain/models/user.dart';
import 'package:movies_recommendation/domain/repository/comics_repository.dart';
import 'package:movies_recommendation/ui/animes/animes_state.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimesBloc extends Cubit<AnimeState> {
  final ComicsRepository _comicsRepository = GetIt.I<ComicsRepository>();
  User user;
  AnimesBloc(
    this.user,
  ) : super(AnimeState());

  Future<void> getFirstState() async {
    Temperatures comics = await _comicsRepository.getAllComics();
    comics.data?.results?.isNotEmpty ?? false
        ? comics.data!.results!.sort(
            (a, b) => a.title!.compareTo(b.title!),
          )
        : {};
    emit(state.copyWith(
      isLoading: false,
      user: user,
      comics: comics,
    ));
  }

  Future<void> startPeriodicFunction(int numMilliseconds) async {
    Timer.periodic(Duration(milliseconds: numMilliseconds), (timer) {
      List<Color> colorGradients = List.from(state.colorGradient);
      Color colorGradient = colorGradients.removeLast();
      colorGradients.insert(0, colorGradient);
      emit(state.copyWith(aux: !state.aux, colorGradient: colorGradients));
    });
  }

  // Función para abrir la URL utilizando url_launcher
  Future<void> launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}
