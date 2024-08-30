import 'dart:convert';

import 'package:kkuljaem_korean_mobile/constants/environment_constant.dart';
import 'package:kkuljaem_korean_mobile/models/response/pokemon_list_response.dart';
import 'package:http/http.dart' as http;

class PokemonListService {
  static Future<PokemonListResponse> getPokemonList({
    required String offset
  }) async {
    try {
      final url =
          Uri.https(Environment.pokeApiURL, "api/v2/pokemon", {
            "limit": "50",
            "offset": offset
          });

      final response = await http.get(url);

      PokemonListResponse pokemonListResponse =
          PokemonListResponse.fromJson(jsonDecode(response.body));

      return pokemonListResponse;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
