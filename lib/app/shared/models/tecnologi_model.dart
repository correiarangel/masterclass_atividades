import 'dart:convert';

class Tecnologiodel {
  final int id;
  final String imgUrl;
  final String name;

  Tecnologiodel({
    required this.id,
    required this.imgUrl,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'name': name,
    };
  }

  factory Tecnologiodel.fromMap(Map<String, dynamic> map) {
    return Tecnologiodel(
      id: map['id'] ?? -1,
      imgUrl: map['imgUrl'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
