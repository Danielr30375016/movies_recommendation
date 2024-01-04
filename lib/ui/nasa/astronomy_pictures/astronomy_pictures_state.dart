import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:movies_recommendation/domain/models/astronomy_pictures_model.dart';

class AstronomyPicturesState extends Equatable {
  final bool isLoading;
  final List<AstronomyPicturesModel> astronomyImages;
  List<Color> colorGradient;
  List<Color> colorGradient2;
  bool aux;
  AstronomyPicturesState({
    this.isLoading = true,
    this.astronomyImages = const [],
    this.colorGradient = const [
      Colors.amber,
      Colors.black,
      Colors.pink,
      Colors.blue
    ],
    this.colorGradient2 = const [
      Colors.blue,
      Colors.black,
      Colors.pink,
      Colors.amber
    ],
    this.aux = false,
  });

  AstronomyPicturesState copyWith({
    bool? isLoading,
    List<AstronomyPicturesModel>? astronomyImages,
    List<Color>? colorGradient,
    List<Color>? colorGradient2,
    bool? aux,
  }) {
    return AstronomyPicturesState(
      isLoading: isLoading ?? this.isLoading,
      astronomyImages: astronomyImages ?? this.astronomyImages,
      colorGradient: colorGradient ?? this.colorGradient,
      colorGradient2: colorGradient2 ?? this.colorGradient2,
      aux: aux ?? this.aux,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        astronomyImages,
        colorGradient,
        colorGradient2,
        aux,
      ];
}
