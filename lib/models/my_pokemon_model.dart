// ignore_for_file: non_constant_identifier_names

class MyPokemonModel {
  final int? id;
  final String? name;
  final String? username;
  final String? image;
  final bool? is_renamed;
  final bool? number_one_is_out;

  MyPokemonModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.image,
      required this.is_renamed,
      required this.number_one_is_out});

  factory MyPokemonModel.fromJson(Map<String, dynamic> json) {
    return MyPokemonModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        image: json['image'],
        is_renamed: json['is_renamed'],
        number_one_is_out: json['number_one_is_out']);
  }
}
