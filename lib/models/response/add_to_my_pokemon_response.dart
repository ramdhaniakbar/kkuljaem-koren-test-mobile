import 'package:kkuljaem_korean_mobile/models/add_to_my_pokemon_model.dart';

class AddToMyPokemonResponse {
  final int status;
  final String message;
  final AddToMyPokemonModel data;

  AddToMyPokemonResponse(
      {required this.status, required this.message, required this.data});

  factory AddToMyPokemonResponse.fromJson(Map<String, dynamic> json) {
    return AddToMyPokemonResponse(
      status: json['status'],
      message: json['message'],
      data: (json['status'] == 201)
          ? AddToMyPokemonModel.fromJson(json['data'])
          : AddToMyPokemonModel.fromJson({}),
    );
  }
}
