import 'package:get/route_manager.dart';
import 'package:kkuljaem_korean_mobile/pages/detail_page.dart';
import 'package:kkuljaem_korean_mobile/pages/home_page.dart';
import 'package:kkuljaem_korean_mobile/pages/my_pokemon_page.dart';

class RouteApp {
  static List<GetPage> routes = [
    GetPage(name: "/", page: () => const HomePage()),
    GetPage(name: "/detail-page", page: () => const DetailPage()),
    GetPage(name: "/my-pokemon-page", page: () => const MyPokemonPage())
  ];
}