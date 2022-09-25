import 'package:booking_app/domain/models/branches_model.dart';

import '../../../app/shared_widgets/loader_widget.dart';
import '../../../data/local_data/booking_database.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/size_manager.dart';
import '../../resources/values_manager.dart';

// ignore: must_be_immutable
class HomeBranchesWidget extends StatelessWidget {
  HomeBranchesWidget({Key? key}) : super(key: key);
  BookingDatabase db = BookingDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding:
          const EdgeInsets.only(right: AppPadding.p16, left: AppPadding.p16),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! / MediaSize.m6_5,
      child: FutureBuilder(
          future: db.readAllBranches(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoaderWidget(
                  height: AppSize.s100, width: AppSize.s100);
            }
            if (snapshot.data.isEmpty) {
              return Center(
                child: Image.asset(
                  ImageAssets.emptyList,
                  width: SizeConfig.screenWidth! / MediaSize.m3,
                  height: SizeConfig.screenHeight! / MediaSize.m3,
                  fit: BoxFit.contain,
                ),
              );
            }
            List<BranchesModel> branches = snapshot.data;
            return ListView.builder(
              itemCount: branches.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(AppMargin.m8),
                  width: SizeConfig.screenWidth! / MediaSize.m4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius:
                          BorderRadius.circular(BorderRadiusValues.br10)),
                  child: Text(
                    "${AppStrings.branch} $index",
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: FontSize.s14),
                  ),
                );
              },
            );
          }),
    );
  }
}
