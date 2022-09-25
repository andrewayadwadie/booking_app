import '../../../app/app_prefs.dart';
import '../../Auth/login_screen.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/values_manager.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
          top: AppPadding.p10, right: AppPadding.p16, left: AppPadding.p16),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! / MediaSize.m10,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1,
                  color: ColorManager.grey.withOpacity(OpicityValue.o5)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth! / MediaSize.m3_3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.logo,
                  width: SizeConfig.screenWidth! / MediaSize.m8,
                  height: SizeConfig.screenHeight! / MediaSize.m8,
                ),
                Text(
                  AppStrings.appName,
                  style: getBoldStyle(
                      color: ColorManager.secondary, fontSize: FontSize.s16),
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                SharedPreferencesHelper.setLoginValue(false);
                Get.offAll(() => LoginScreen());
              },
              icon: Icon(
                Icons.logout,
                color: ColorManager.error,
              ))
        ],
      ),
    );
  }
}
