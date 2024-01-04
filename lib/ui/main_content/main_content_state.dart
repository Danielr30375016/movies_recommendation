import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MainContentState extends Equatable {
  List<Color> colorGradient;
  List<Color> colorGradient2;
  bool aux;
  MainContentState({
    this.colorGradient = const [Colors.purple, Colors.red, Colors.black],
    this.colorGradient2 = const [
      Colors.black,
      Colors.purple,
      Colors.red,
    ],
    this.aux = false,
  });

  MainContentState copyWith({
    List<Color>? colorGradient,
    List<Color>? colorGradient2,
    bool? aux,
  }) {
    return MainContentState(
      colorGradient: colorGradient ?? this.colorGradient,
      colorGradient2: colorGradient2 ?? this.colorGradient2,
      aux: aux ?? this.aux,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [colorGradient, colorGradient2, aux];
}
