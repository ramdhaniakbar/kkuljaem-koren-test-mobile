import 'dart:convert';

import 'package:kkuljaem_korean_mobile/constants/environment_constant.dart';
import 'package:kkuljaem_korean_mobile/models/response/catch_pokemon_response.dart';
import 'package:http/http.dart' as http;

class CatchPokemonService {
  static Future<CatchPokemonResponse> catchPokemon() async {
    try {
      final url = Uri.http(Environment.apiBaseURL, "api/v1/catch-pokemon");

      final response = await http.get(url);

      CatchPokemonResponse catchPokemonResponse =
          CatchPokemonResponse.fromJson(jsonDecode(response.body));

      return catchPokemonResponse;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
