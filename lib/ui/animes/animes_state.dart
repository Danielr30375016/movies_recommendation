import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_recommendation/domain/models/comic.dart';
import 'package:movies_recommendation/domain/models/user.dart';

// ignore: must_be_immutable
class AnimeState extends Equatable {
  final bool isLoading;
  final bool aux;
  final User? user;
  final Temperatures? comics;
  List<Color> colorGradient;
  List<Color> colorGradient2;
  AnimeState({
    this.isLoading = true,
    this.aux = true,
    this.user,
    this.comics,
    this.colorGradient = const [Colors.purple, Colors.red, Colors.black],
    this.colorGradient2 = const [
      Colors.black,
      Colors.purple,
      Colors.red,
    ],
  });

  AnimeState copyWith({
    bool? isLoading,
    bool? aux,
    User? user,
    Temperatures? comics,
    List<Color>? colorGradient,
    List<Color>? colorGradient2,
  }) {
    return AnimeState(
      isLoading: isLoading ?? this.isLoading,
      aux: aux ?? this.aux,
      user: user ?? this.user,
      comics: comics ?? this.comics,
      colorGradient: colorGradient ?? this.colorGradient,
      colorGradient2: colorGradient2 ?? this.colorGradient2,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        user,
        comics,
        aux,
        colorGradient,
        colorGradient2,
      ];
}
