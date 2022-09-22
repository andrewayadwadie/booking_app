import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/resources/theme_manager.dart';
import '../presentation/splash/splash_screen.dart';
import 'binding/binding_controller.dart';
 

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  //! named constructor
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance =
      MyApp._internal(); //! singleton or single instance

  factory MyApp() => _instance; //! factory

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: IntialBinding(),
      title: 'Booking App',
      theme: getApplicationTheme(),
      home: const SplashScreen(),
      
    );
  }
}
