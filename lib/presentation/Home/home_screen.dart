import 'widget/branches_widget.dart';
import 'widget/header_widget.dart';
import 'widget/rooms_widget.dart';
import 'widget/title_widget.dart';
import 'package:flutter/material.dart';

import '../resources/size_manager.dart';
import '../resources/strings_manager.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HomeHeaderWidget(),
          HomeTitleWidget(
            title: AppStrings.branches,
          ),
          HomeBranchesWidget(),
          HomeTitleWidget(
            title: AppStrings.rooms,
          ),
          HomeRoomsWidget(),
        ],
      )),
    );
  }
}
