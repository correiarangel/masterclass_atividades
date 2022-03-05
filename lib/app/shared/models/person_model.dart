import 'package:flutter/material.dart';

@immutable
class PersonModel {
  final double weight;
  final double height;

  const PersonModel({
    required this.weight,
    required this.height,
  });

  factory PersonModel.empty() {
    return const PersonModel(
      weight: 0.0,
      height: 0.0,
    );
  }

  PersonModel copyWith({
    double? weight,
    double? height,
  }) {
    return PersonModel(
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  double getBMI() => weight / (height * weight);
}
