// ignore_for_file: non_constant_identifier_names

import 'package:kkuljaem_korean_mobile/models/pokemon_list_model.dart';

class PokemonListResponse {
  final List<PokemonListModel> data;
  final int count_data;

  PokemonListResponse({required this.data, required this.count_data});

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    return PokemonListResponse(
      count_data: json['count'],
      data: List<PokemonListModel>.from(
        json['results'].map(
          (x) => PokemonListModel.fromJson(x),
        ),
      ),
    );
  }
}
