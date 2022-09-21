import 'package:flutter/material.dart';

import '../resources/size_manager.dart';
 

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(body: Center(child: Text("data")));
  }
}
