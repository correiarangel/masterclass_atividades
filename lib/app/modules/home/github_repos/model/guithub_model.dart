import 'package:flutter/material.dart';

@immutable
class GuitHubRepsModel {
  final int id;
  final String htmlUrl;
  final String name;
  final String login;

  const GuitHubRepsModel({
    required this.id,
    required this.htmlUrl,
    required this.name,
    required this.login,
  });

  factory GuitHubRepsModel.empty() {
    return const GuitHubRepsModel(
      id: 0,
      htmlUrl: '',
      name: '',
      login: '',
    );
  }

  GuitHubRepsModel copyWith({
    int? id,
    String? htmlUrl,
    String? name,
    String? login,
  }) {
    return GuitHubRepsModel(
      id: id ?? this.id,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      name: name ?? this.name,
      login: login ?? this.login,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'html_url': htmlUrl,
      'name': name,
      'login': login,
    };
  }

  factory GuitHubRepsModel.fromMap(Map<String, dynamic> map) {
    return GuitHubRepsModel(
      id: map['owner']['id'],
      htmlUrl: map['html_url'],
      name: map['name'],
      login: map['owner']['login'],
    );
  }
}
