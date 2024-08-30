// ignore_for_file: non_constant_identifier_names

class RenamePokemonModel {
  final int? number_fibonacci;
  final dynamic my_pokemon;

  RenamePokemonModel(
      {required this.number_fibonacci, required this.my_pokemon});

  factory RenamePokemonModel.fromJson(Map<String, dynamic> json) {
    return RenamePokemonModel(
        number_fibonacci: json['number_fibonacci'],
        my_pokemon: json['my_pokemon']);
  }
}
