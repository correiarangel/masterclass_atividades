import 'package:flutter/material.dart';

@immutable
class Person {
  final int id;
  final String name;
  final String lastName;
  final int age;

  const Person({
    required this.id,
    required this.name,
    required this.lastName,
    required this.age,
  });

  factory Person.empty() {
    return const Person(
      id: 0,
      name: '',
      lastName: '',
      age: 0,
    );
  }

  Person copyWith({
    int? id,
    String? name,
    String? lastName,
    int? age,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'age': age,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      lastName: map['lastName'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }
}
