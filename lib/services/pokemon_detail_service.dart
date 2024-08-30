// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:kkuljaem_korean_mobile/constants/environment_constant.dart';
import 'package:kkuljaem_korean_mobile/models/response/pokemon_detail_response.dart';
import 'package:http/http.dart' as http;

class PokemonDetailService {
  static Future<PokemonDetailResponse> getPokemonDetail(
      {required String name}) async {
    try {
      final url = Uri.https(Environment.pokeApiURL, "api/v2/pokemon/${name}");

      final response = await http.get(url);

      PokemonDetailResponse pokemonDetailResponse =
          PokemonDetailResponse.fromJson(jsonDecode(response.body));

      return pokemonDetailResponse;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
