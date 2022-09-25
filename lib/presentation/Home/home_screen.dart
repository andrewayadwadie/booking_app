
import 'package:flutter/material.dart';

import '../../data/local_data/booking_database.dart';
import '../resources/size_manager.dart';
import '../resources/strings_manager.dart';
import 'widget/branches_widget.dart';
import 'widget/header_widget.dart';
import 'widget/rooms_widget.dart';
import 'widget/title_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  BookingDatabase db = BookingDatabase.instance;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeaderWidget(),
          const HomeTitleWidget(
            title: AppStrings.branches,
          ),
          const HomeBranchesWidget(),
          const HomeTitleWidget(
            title: AppStrings.rooms,
          ),
          HomeRoomsWidget(),
        ],
      )),
    );
  }
}
