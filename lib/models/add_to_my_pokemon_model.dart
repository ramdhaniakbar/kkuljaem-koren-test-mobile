// ignore_for_file: non_constant_identifier_names

class AddToMyPokemonModel {
  final int? id;
  final String? name;
  final String? username;
  final bool? is_renamed;
  final bool? number_one_is_out;

  AddToMyPokemonModel(
      {required this.id,
      required this.username,
      required this.name,
      required this.is_renamed,
      required this.number_one_is_out});

  factory AddToMyPokemonModel.fromJson(Map<String, dynamic> json) {
    return AddToMyPokemonModel(
        id: json['id'],
        username: json['username'],
        name: json['name'],
        is_renamed: json['is_renamed'],
        number_one_is_out: json['number_one_is_out']);
  }
}
