import 'dart:convert';

import 'package:kkuljaem_korean_mobile/constants/environment_constant.dart';
import 'package:kkuljaem_korean_mobile/models/response/release_pokemon_response.dart';
import 'package:http/http.dart' as http;

class ReleasePokemonService {
  static Future<ReleasePokemonResponse> releasePokemon(
      {required String username}) async {
    try {
      final url = Uri.http(Environment.apiBaseURL, "api/v1/release-pokemon",
          {"username": username});

      final response = await http.post(url);

      ReleasePokemonResponse releasePokemonResponse =
          ReleasePokemonResponse.fromJson(jsonDecode(response.body));

      return releasePokemonResponse;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
