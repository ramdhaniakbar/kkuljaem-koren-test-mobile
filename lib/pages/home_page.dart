import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kkuljaem_korean_mobile/helpers/format_helper.dart';
import 'package:kkuljaem_korean_mobile/models/pokemon_list_model.dart';
import 'package:kkuljaem_korean_mobile/models/response/pokemon_list_response.dart';
import 'package:kkuljaem_korean_mobile/services/pokemon_list_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<PokemonListModel> pokemonList = List.empty();
  final ScrollController _listPokemonController = ScrollController();
  int limit = 10;
  late int offset = 0;
  num countPokemon = 0;
  bool isLoading = true;
  bool hasMorePokemon = true;

  @override
  void initState() {
    getPokemonList();

    _listPokemonController.addListener(() {
      if (_listPokemonController.position.maxScrollExtent ==
          _listPokemonController.offset) {
        hasMorePokemon = true;
        offset = limit + 1;
        getPokemonList();
      }
    });

    super.initState();
  }

  Future<void> getPokemonList() async {
    PokemonListResponse pokemonListResponse =
        await PokemonListService.getPokemonList(offset: offset.toString());

    setState(() {
      if (pokemonListResponse.data.isNotEmpty) {
        pokemonList = pokemonListResponse.data;
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
          "Pokemon List Page",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                color: Color(0xFF000000).withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 20,
                                offset: Offset(0, 4),
                              )
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://img.pokemondb.net/artwork/${e.name}.jpg",
                              width: 60,
                              height: 60,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FormatHelper.toCapitalize(e.name!),
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('/detail-page',
                                          arguments: {"name": e.name});
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 8),
                                      backgroundColor: const Color(0xFF56C2D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Detail Page',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
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
                                  )
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
    );
  }
}
