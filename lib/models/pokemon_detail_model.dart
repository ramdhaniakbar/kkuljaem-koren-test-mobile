class PokemonDetailModel {
  final String? name;
  final List<MoveModel> moves;
  final List<TypeModel> types;

  PokemonDetailModel(
      {required this.name, required this.moves, required this.types});

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    var movesList = (json['moves'] as List)
        .map((move) => MoveModel.fromJson(move))
        .toList();
    var typesList = (json['types'] as List)
        .map((type) => TypeModel.fromJson(type))
        .toList();
    return PokemonDetailModel(
      name: json['name'],
      moves: movesList,
      types: typesList,
    );
  }
}

class MoveModel {
  final String name;
  final String url;

  MoveModel({required this.name, required this.url});

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(name: json['move']['name'], url: json['move']['url']);
  }
}

class TypeModel {
  final String name;
  final String url;

  TypeModel({required this.name, required this.url});

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(name: json['type']['name'], url: json['type']['url']);
  }
}
