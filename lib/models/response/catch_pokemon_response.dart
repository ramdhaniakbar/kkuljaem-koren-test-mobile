import 'package:kkuljaem_korean_mobile/models/catch_pokemon_model.dart';

class CatchPokemonResponse {
  final int status;
  final String message;
  final CatchPokemonModel data;

  CatchPokemonResponse(
      {required this.status, required this.message, required this.data});

  factory CatchPokemonResponse.fromJson(Map<String, dynamic> json) {
    return CatchPokemonResponse(
      status: json['status'],
      message: json['message'],
      data: CatchPokemonModel.fromJson(json['data']),
    );
  }
}
