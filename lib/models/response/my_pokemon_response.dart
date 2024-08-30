import 'package:kkuljaem_korean_mobile/models/my_pokemon_model.dart';

class MyPokemonResponse {
  final int status;
  final String message;
  final List<MyPokemonModel> data;

  MyPokemonResponse(
      {required this.status, required this.message, required this.data});

  factory MyPokemonResponse.fromJson(Map<String, dynamic> json) {
    return MyPokemonResponse(
      status: json['status'],
      message: json['message'],
      data: List<MyPokemonModel>.from(
        json['data'].map(
          (x) => MyPokemonModel.fromJson(x),
        ),
      ),
    );
  }
}
