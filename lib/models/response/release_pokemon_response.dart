import 'package:kkuljaem_korean_mobile/models/release_pokemon_model.dart';

class ReleasePokemonResponse {
  final int status;
  final String message;
  final ReleasePokemonModel data;

  ReleasePokemonResponse(
      {required this.status, required this.message, required this.data});

  factory ReleasePokemonResponse.fromJson(Map<String, dynamic> json) {
    return ReleasePokemonResponse(
      status: json['status'],
      message: json['message'],
      data: (json['status'] == 200)
          ? ReleasePokemonModel.fromJson(json['data'])
          : ReleasePokemonModel.fromJson({}),
    );
  }
}
