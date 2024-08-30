// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kkuljaem_korean_mobile/components/alert_dialog_component.dart';
import 'package:kkuljaem_korean_mobile/components/button_component.dart';
import 'package:kkuljaem_korean_mobile/components/text_field_component.dart';
import 'package:kkuljaem_korean_mobile/constants/asset_constant.dart';
import 'package:kkuljaem_korean_mobile/helpers/format_helper.dart';
import 'package:kkuljaem_korean_mobile/models/pokemon_detail_model.dart';
import 'package:kkuljaem_korean_mobile/models/response/add_to_my_pokemon_response.dart';
import 'package:kkuljaem_korean_mobile/models/response/catch_pokemon_response.dart';
import 'package:kkuljaem_korean_mobile/models/response/pokemon_detail_response.dart';
import 'package:kkuljaem_korean_mobile/services/add_to_my_pokemon_service.dart';
import 'package:kkuljaem_korean_mobile/services/catch_pokemon_service.dart';
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

  final TextEditingController nicknameController = TextEditingController();

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

  Future<void> catchPokemon() async {
    setState(() {
      isLoading = true;
    });

    CatchPokemonResponse catchPokemonResponse =
        await CatchPokemonService.catchPokemon();

    if (catchPokemonResponse.data.is_success == true) {
      setState(() {
        isLoading = false;
        showDialog(
          context: context,
          builder: (context) => AlertDialogComponent(
              title: 'Success',
              description: catchPokemonResponse.message,
              imageLocation: '${AssetConstant.icon}success.png',
              actionWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Give a nickname',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFieldComponent(
                    controller: nicknameController,
                    hintText: 'Input a nickname',
                    textInputType: TextInputType.text,
                    obscure: false,
                    shadow: false,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonComponent(
                    buttonLabel: 'Submit',
                    buttonColor: Colors.blueAccent,
                    onPressed: () {
                      addToMyPokemonList(nickname: nicknameController.text);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )),
        );
      });
    } else {
      setState(() {
        isLoading = false;
        showDialog(
          context: context,
          builder: (context) => AlertDialogComponent(
            title: 'Failed',
            description: catchPokemonResponse.message,
            imageLocation: '${AssetConstant.icon}error.png',
            actionWidget: ButtonComponent(
                buttonLabel: 'Close',
                buttonColor: Colors.redAccent,
                onPressed: () => Get.back()),
          ),
        );
      });
    }
  }

  Future<void> addToMyPokemonList({required String nickname}) async {
    setState(() {
      isLoading = true;
      Get.back();
    });

    AddToMyPokemonResponse addToMyPokemonResponse =
        await AddToMyPokemonService.addToMyPokemon(
            name: name, nickname: nickname);

    if (addToMyPokemonResponse.status == 201) {
      setState(() {
        isLoading = false;
        showDialog(
          context: context,
          builder: (context) => AlertDialogComponent(
            title: 'Success',
            description: addToMyPokemonResponse.message,
            imageLocation: '${AssetConstant.icon}success.png',
            actionWidget: ButtonComponent(
                buttonLabel: 'To My Pokemon',
                buttonColor: Colors.blueAccent,
                onPressed: () {
                  Get.toNamed('/my-pokemon-page');
                }),
          ),
        );
      });
    } else {
      setState(() {
        isLoading = false;
        showDialog(
          context: context,
          builder: (context) => AlertDialogComponent(
            title: 'Failed',
            description: addToMyPokemonResponse.message,
            imageLocation: '${AssetConstant.icon}error.png',
            actionWidget: ButtonComponent(
                buttonLabel: 'Close',
                buttonColor: Colors.redAccent,
                onPressed: () => Get.back()),
          ),
        );
      });
    }
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
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Text(
                                  FormatHelper.toCapitalize(
                                      pokemonDetail.name!),
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await catchPokemon();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                backgroundColor: const Color(0xFF56C2D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Catch Pokemon',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Types Skills: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ...pokemonDetail.types.map((type) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        FormatHelper.toCapitalize(type.name),
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    );
                                  }),
                                ]),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Moves Skills: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ...pokemonDetail.moves.map((move) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        FormatHelper.toCapitalize(move.name),
                                        style: const TextStyle(fontSize: 14),
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
