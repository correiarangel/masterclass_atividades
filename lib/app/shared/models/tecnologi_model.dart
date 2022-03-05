import 'dart:convert';

import 'package:flutter/material.dart';
@immutable
class TecnologiModel {
  final int id;
  final String imgUrl;
  final String name;

  const TecnologiModel({
    required this.id,
    required this.imgUrl,
    required this.name,
  });

  TecnologiModel copyWith({
    int? id,
    String? imgUrl,
    String? name,
  }) {
    return TecnologiModel(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'name': name,
    };
  }

  factory TecnologiModel.fromMap(Map<String, dynamic> map) {
    return TecnologiModel(
      id: map['id'] ?? -1,
      imgUrl: map['imgUrl'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
