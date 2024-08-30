import 'package:kkuljaem_korean_mobile/models/rename_pokemon_model.dart';

class RenamePokemonResponse {
  final int status;
  final String message;
  final RenamePokemonModel data;

  RenamePokemonResponse(
      {required this.status, required this.message, required this.data});

  factory RenamePokemonResponse.fromJson(Map<String, dynamic> json) {
    return RenamePokemonResponse(
      status: json['status'],
      message: json['message'],
      data: (json['status'] == 200)
          ? RenamePokemonModel.fromJson(json['data'])
          : RenamePokemonModel.fromJson({}),
    );
  }
}
