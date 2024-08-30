import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kkuljaem_korean_mobile/routes/route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RouteApp.routes,
      initialRoute: "/",
    );
  }
}
