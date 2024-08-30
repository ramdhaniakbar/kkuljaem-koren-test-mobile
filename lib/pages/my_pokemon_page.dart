import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:kkuljaem_korean_mobile/components/alert_dialog_component.dart';
import 'package:kkuljaem_korean_mobile/components/button_component.dart';
import 'package:kkuljaem_korean_mobile/constants/asset_constant.dart';
import 'package:kkuljaem_korean_mobile/helpers/format_helper.dart';
import 'package:kkuljaem_korean_mobile/models/my_pokemon_model.dart';
import 'package:kkuljaem_korean_mobile/models/response/my_pokemon_response.dart';
import 'package:kkuljaem_korean_mobile/models/response/release_pokemon_response.dart';
import 'package:kkuljaem_korean_mobile/models/response/rename_pokemon_response.dart';
import 'package:kkuljaem_korean_mobile/services/my_pokemon_service.dart';
import 'package:kkuljaem_korean_mobile/services/release_pokemon_service.dart';
import 'package:kkuljaem_korean_mobile/services/rename_pokemon_service.dart';

class MyPokemonPage extends StatefulWidget {
  const MyPokemonPage({super.key});

  @override
  State<MyPokemonPage> createState() => _MyPokemonPageState();
}

class _MyPokemonPageState extends State<MyPokemonPage> {
  late List<MyPokemonModel> pokemonList = List.empty();
  bool isLoading = true;

  @override
  void initState() {
    getMyPokemon();

    super.initState();
  }

  Future<void> getMyPokemon() async {
    MyPokemonResponse myPokemonResponse = await MyPokemonService.getMyPokemon();

    setState(() {
      if (myPokemonResponse.status == 200) {
        isLoading = false;
        pokemonList = myPokemonResponse.data;
      }
    });
  }

  Future<void> releasePokemon({required String username}) async {
    setState(() {
      isLoading = true;
    });

    ReleasePokemonResponse releasePokemonResponse =
        await ReleasePokemonService.releasePokemon(username: username);

    if (releasePokemonResponse.data.is_prime_number == true) {
      setState(() {
        isLoading = false;
        showDialog(
          context: context,
          builder: (context) => AlertDialogComponent(
            title: 'Success',
            description: releasePokemonResponse.message,
            imageLocation: '${AssetConstant.icon}success.png',
            actionWidget: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Number is Prime Number: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      releasePokemonResponse.data.number.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonComponent(
                    buttonLabel: 'Close',
                    buttonColor: Colors.blueAccent,
                    onPressed: () {
                      Get.back();
                      getMyPokemon();
                    })
              ],
            ),
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
            description: releasePokemonResponse.message,
            imageLocation: '${AssetConstant.icon}error.png',
            actionWidget: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Number is not Prime Number: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      releasePokemonResponse.data.number.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonComponent(
                    buttonLabel: 'Close',
                    buttonColor: Colors.redAccent,
                    onPressed: () {
                      Get.back();
                    })
              ],
            ),
          ),
        );
      });
    }
  }

  Future<void> renamePokemon({required String username}) async {
    setState(() {
      isLoading = true;
    });

    RenamePokemonResponse renamePokemonResponse = await RenamePokemonService.renamePokemonResponse(username: username);

    if (renamePokemonResponse.status == 200) {
      setState(() {
        isLoading = false;
        showDialog(
          context: context,
          builder: (context) => AlertDialogComponent(
            title: 'Success',
            description: renamePokemonResponse.message,
            imageLocation: '${AssetConstant.icon}success.png',
            actionWidget: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Rename to fibonacci number: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      renamePokemonResponse.data.number_fibonacci.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonComponent(
                    buttonLabel: 'Close',
                    buttonColor: Colors.blueAccent,
                    onPressed: () {
                      Get.back();
                      getMyPokemon();
                    })
              ],
            ),
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
          "My Pokemon Page",
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: pokemonList
                          .map<Widget>(
                            (e) => Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 15.0),
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
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
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    e.image!,
                                    width: 60,
                                    height: 60,
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              FormatHelper.toCapitalize(
                                                  e.name!),
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Text(' - '),
                                            Text(
                                              e.username!,
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.toNamed('/detail-page',
                                                    arguments: {
                                                      "name": e.name
                                                    });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 8),
                                                backgroundColor:
                                                    const Color(0xFF56C2D9),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Detail Page',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_right_rounded,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                releasePokemon(
                                                    username: e.username!);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 8),
                                                backgroundColor:
                                                    Colors.redAccent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Release Pokemon',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                renamePokemon(
                                                    username: e.username!);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 8),
                                                backgroundColor:
                                                    Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Rename Pokemon',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 2.0, // Margin around the notch
        child: IconButton(
          icon: const Icon(Icons.my_library_add_rounded),
          onPressed: () {},
        ),
      ),
    );
  }
}
