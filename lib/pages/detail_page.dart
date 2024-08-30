// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kkuljaem_korean_mobile/helpers/format_helper.dart';
import 'package:kkuljaem_korean_mobile/models/pokemon_detail_model.dart';
import 'package:kkuljaem_korean_mobile/models/response/pokemon_detail_response.dart';
import 'package:kkuljaem_korean_mobile/services/pokemon_detail_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String name = Get.arguments['name'] ?? '';
  late PokemonDetailModel pokemonDetail;
  bool isLoading = true;

  @override
  void initState() {
    getPokemonDetail();

    super.initState();
  }

  Future<void> getPokemonDetail() async {
    PokemonDetailResponse pokemonDetailResponse =
        await PokemonDetailService.getPokemonDetail(name: name);

    setState(() {
      if (pokemonDetailResponse.data != null) {
        pokemonDetail = pokemonDetailResponse.data;
        isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Detail Pokemon Page",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: isLoading
            ? const Center(
                child: SpinKitThreeInOut(
                  color: Colors.blue,
                  size: 50.0,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              "https://img.pokemondb.net/artwork/${pokemonDetail.name}.jpg",
                              width: 60,
                              height: 60,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Text(
                                FormatHelper.toCapitalize(pokemonDetail.name!),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Types Skills: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ...pokemonDetail.types.map((type) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        FormatHelper.toCapitalize(type.name),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    );
                                  }),
                                ]),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Moves Skills: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ...pokemonDetail.moves.map((move) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        FormatHelper.toCapitalize(move.name),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    );
                                  }),
                                ]),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
