import 'dart:convert';

import 'package:kkuljaem_korean_mobile/constants/environment_constant.dart';
import 'package:kkuljaem_korean_mobile/models/response/add_to_my_pokemon_response.dart';
import 'package:http/http.dart' as http;

class AddToMyPokemonService {
  static Future<AddToMyPokemonResponse> addToMyPokemon(
      {required String name, required String nickname}) async {
    try {
      final url = Uri.http(
          Environment.apiBaseURL, "api/v1/add-to-my-pokemon", {"name": name});

      final response = await http.post(url, body: {"username": nickname});

      AddToMyPokemonResponse addToMyPokemonResponse =
          AddToMyPokemonResponse.fromJson(jsonDecode(response.body));

      return addToMyPokemonResponse;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
