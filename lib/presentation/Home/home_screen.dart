
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/size_manager.dart';
import '../resources/styles_manager.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Center(
            child: InkWell(
      onTap: () async{
 

      },
      child: Container(
        width: 200,
        height: 200,
        color: ColorManager.error,
        child: Text(
          "add data of Hotel",
          style: getMediumStyle(color: ColorManager.white),
        ),
      ),
    )));
  }
}
