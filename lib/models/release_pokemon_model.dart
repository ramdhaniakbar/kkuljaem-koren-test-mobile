// ignore_for_file: non_constant_identifier_names

class ReleasePokemonModel {
  final int? number;
  final bool? is_prime_number;
  final dynamic my_pokemon;

  ReleasePokemonModel(
      {required this.number,
      required this.is_prime_number,
      required this.my_pokemon});

  factory ReleasePokemonModel.fromJson(Map<String, dynamic> json) {
    return ReleasePokemonModel(
        number: json['number'],
        is_prime_number: json['is_prime_number'],
        my_pokemon: json['my_pokemon']);
  }
}
