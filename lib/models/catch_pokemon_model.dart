// ignore_for_file: non_constant_identifier_names

class CatchPokemonModel {
  final bool? is_success;

  CatchPokemonModel({required this.is_success});

  factory CatchPokemonModel.fromJson(Map<String, dynamic> json) {
    return CatchPokemonModel(is_success: json['is_success']);
  }
}
