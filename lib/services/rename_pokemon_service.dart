import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kkuljaem_korean_mobile/constants/environment_constant.dart';
import 'package:kkuljaem_korean_mobile/models/response/rename_pokemon_response.dart';

class RenamePokemonService {
  static Future<RenamePokemonResponse> renamePokemonResponse(
      {required String username}) async {
    try {
      final url = Uri.http(Environment.apiBaseURL, "api/v1/rename-pokemon",
          {"username": username});

      final response = await http.post(url);

      RenamePokemonResponse renamePokemonResponse =
          RenamePokemonResponse.fromJson(jsonDecode(response.body));

      return renamePokemonResponse;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
