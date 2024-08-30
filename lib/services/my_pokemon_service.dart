import 'dart:convert';

import 'package:kkuljaem_korean_mobile/constants/environment_constant.dart';
import 'package:kkuljaem_korean_mobile/models/response/my_pokemon_response.dart';
import 'package:http/http.dart' as http;

class MyPokemonService {
  static Future<MyPokemonResponse> getMyPokemon() async {
    try {
      final url = Uri.http(Environment.apiBaseURL, "api/v1/my-pokemon");

      final response = await http.get(url);

      MyPokemonResponse myPokemonResponse = MyPokemonResponse.fromJson(jsonDecode(response.body));

      return myPokemonResponse;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}