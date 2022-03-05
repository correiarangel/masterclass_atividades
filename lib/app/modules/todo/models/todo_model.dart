import 'package:flutter/material.dart';

@immutable
class TodoModel {
  final String id;
  final String title;
  final bool isChecked;

  const TodoModel({
    required this.id,
    required this.title,
    required this.isChecked,
  });

  factory TodoModel.empty() {
    return const TodoModel(
      id:'0',
      title: '',
      isChecked: false,
    );
  }

  TodoModel copyWith({
    String? id,
    String? title,
    bool? isChecked,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      isChecked: map['isChecked'],
    );
  }
}
