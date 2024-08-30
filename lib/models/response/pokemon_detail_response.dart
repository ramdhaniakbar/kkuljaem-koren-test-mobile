import 'package:kkuljaem_korean_mobile/models/pokemon_detail_model.dart';

class PokemonDetailResponse {
  final PokemonDetailModel data;

  PokemonDetailResponse({required this.data});

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) {
    return PokemonDetailResponse(
      data: PokemonDetailModel.fromJson(json),
    );
  }
}
