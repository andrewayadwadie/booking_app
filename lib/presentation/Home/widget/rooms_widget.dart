import 'package:booking_app/presentation/resources/font_manager.dart';
import 'package:booking_app/presentation/resources/strings_manager.dart';
import 'package:booking_app/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/values_manager.dart';

class HomeRoomsWidget extends StatelessWidget {
  const HomeRoomsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        padding:
            const EdgeInsets.only(right: AppPadding.p16, left: AppPadding.p16),
        width: SizeConfig.screenWidth,
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                height: SizeConfig.screenHeight! / MediaSize.m10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorManager.lightGrey,
                    borderRadius:
                        BorderRadius.circular(BorderRadiusValues.br10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: AppMargin.m8),
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth! / MediaSize.m1_5,
                  
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${AppStrings.branchName} : name",
                            style: getMediumStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14),
                            maxLines: MaxLineValues.max1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${AppStrings.roomNo} : 25",
                            style: getMediumStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14),
                            maxLines: MaxLineValues.max1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: AppMargin.m8),
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth! / MediaSize.m5_5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(AppMargin.m1),
                              alignment: Alignment.center,
                              width: SizeConfig.screenWidth,
                              decoration: BoxDecoration(
                                  color: ColorManager.secondary,
                                  borderRadius: BorderRadius.circular(
                                      BorderRadiusValues.br5)),
                              child: Text(
                                AppStrings.available,
                                style:
                                    getMediumStyle(color: ColorManager.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(AppMargin.m1),
                              alignment: Alignment.center,
                              width: SizeConfig.screenWidth,
                              decoration: BoxDecoration(
                                  color: ColorManager.secondary,
                                  borderRadius: BorderRadius.circular(
                                      BorderRadiusValues.br5)),
                              child: Text(
                                AppStrings.single,
                                style:
                                    getMediumStyle(color: ColorManager.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
