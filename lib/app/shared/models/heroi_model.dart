class HeroiModel {
  int? id;
  String? name;
  String? poder;
  String? descricao;

  HeroiModel({
     this.id,
     this.name,
     this.poder,
     this.descricao,
  });

  factory HeroiModel.fromJson(Map<String, dynamic> json) {

    return HeroiModel(
      id: json['id'],
      name: json['name'],
      poder: json['poder'],
      descricao: json['descricao'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['poder'] = poder;
    data['descricao'] = descricao;
    return data;
  }
}
