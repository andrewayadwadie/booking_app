import 'package:booking_app/presentation/resources/color_manager.dart';
import 'package:booking_app/presentation/resources/font_manager.dart';
import 'package:booking_app/presentation/resources/strings_manager.dart';
import 'package:booking_app/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/size_manager.dart';
import '../../resources/values_manager.dart';

class HomeBranchesWidget extends StatelessWidget {
  const HomeBranchesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding:
          const EdgeInsets.only(right: AppPadding.p16, left: AppPadding.p16),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! / MediaSize.m6_5,
     
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(AppMargin.m8),
            width:  SizeConfig.screenWidth!/MediaSize.m4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(BorderRadiusValues.br10)
            ),
            child: Text("${AppStrings.branch} $index",
              style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s14),
            ),
          );
        },
      ),
    );
  }
}
