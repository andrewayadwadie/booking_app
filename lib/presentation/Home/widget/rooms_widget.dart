import '../../../app/shared_widgets/loader_widget.dart';
import '../../../domain/models/rooms_model.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../../data/local_data/booking_database.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/values_manager.dart';

// ignore: must_be_immutable
class HomeRoomsWidget extends StatelessWidget {
  HomeRoomsWidget({Key? key}) : super(key: key);
  BookingDatabase db = BookingDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        padding:
            const EdgeInsets.only(right: AppPadding.p16, left: AppPadding.p16),
        width: SizeConfig.screenWidth,
        child: FutureBuilder(
            future: db.readAllRooms(),
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
              List<RoomsModel> rooms = snapshot.data;
              return ListView.builder(
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: AppMargin.m8),
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
                            margin: const EdgeInsets.symmetric(
                                vertical: AppMargin.m8),
                            height: SizeConfig.screenHeight,
                            width: SizeConfig.screenWidth! / MediaSize.m1_5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${AppStrings.branchNumber} : ${rooms[index].branchId}",
                                  style: getMediumStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s14),
                                  maxLines: MaxLineValues.max1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${AppStrings.roomNo} : ${rooms[index].roomNumber}",
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
                            margin: const EdgeInsets.symmetric(
                                vertical: AppMargin.m8),
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
                                      rooms[index].status == 0
                                          ? AppStrings.available
                                          : AppStrings.notAvailable,
                                      style: getMediumStyle(
                                          color: ColorManager.white),
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
                                      rooms[index].roomTypeId == 0
                                          ? AppStrings.single
                                          : rooms[index].roomTypeId == 1
                                              ? AppStrings.roomDouble
                                              : AppStrings.suite,
                                      style: getMediumStyle(
                                          color: ColorManager.white),
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
                  });
            }),
      ),
    );
  }
}
