import 'package:flutter/cupertino.dart';

@immutable
class IntoxianimeModel {
  final int id;
  final String date;
  final String guidUrl;
  final String link;
  final String title;

  const IntoxianimeModel({
    required this.id,
    required this.date,
    required this.guidUrl,
    required this.link,
    required this.title,
  });

  factory IntoxianimeModel.fromMap(Map<String, dynamic> map) {
    return IntoxianimeModel(
      id: map['id'],
      date: map['date'],
      guidUrl: map['guid']['rendered'],
      link: map['link'],
      title: map['title']['rendered'],
    );
  }
  IntoxianimeModel copyWith({
    int? id,
    String? date,
    String? guidUrl,
    String? link,
    String? title,
  }) {
    return IntoxianimeModel(
      id: id ?? this.id,
      date: date ?? this.date,
      guidUrl: guidUrl ?? this.guidUrl,
      link: link ?? this.link,
      title: title ?? this.title,
    );
  }

  factory IntoxianimeModel.empty() {
    return const IntoxianimeModel(
      id: -1,
      date: '',
      guidUrl: '',
      link: '',
      title: '',
    );
  }
}
