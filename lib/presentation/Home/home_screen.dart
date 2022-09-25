
import 'package:booking_app/domain/models/branches_model.dart';
import 'package:flutter/material.dart';

import '../../data/local_data/booking_database.dart';
import '../../domain/models/rooms_model.dart';
import '../resources/size_manager.dart';
import '../resources/strings_manager.dart';
import 'widget/branches_widget.dart';
import 'widget/header_widget.dart';
import 'widget/rooms_widget.dart';
import 'widget/title_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            HomeTitleWidget(
            title: AppStrings.branches,
             addFunction: () async {
              await db.createBranches(const BranchesModel(location: "cairo", hotelId: 1, name: "branch "));
              setState(() {});
            },
          ),
            HomeBranchesWidget(),
          HomeTitleWidget(
            title: AppStrings.rooms,
            addFunction: () async {
              await db.createRooms(const RoomsModel(
                  roomNumber: 1, status: 0, roomTypeId: 0, branchId: 1));
              setState(() {});
            },
          ),
          HomeRoomsWidget(),
        ],
      )),
    );
  }
}
