import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding:
          const EdgeInsets.only(right: AppPadding.p16, left: AppPadding.p16),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! / MediaSize.m18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: getBoldStyle(
                color: ColorManager.secondary,
                fontSize: FontSize.s16,
              )),
          Text(AppStrings.seeAll,
              style: getUnderLineStyle(
                color: ColorManager.secondary,
                fontSize: FontSize.s16,
              )),
        ],
      ),
    );
  }
}
