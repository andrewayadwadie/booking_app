import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/values_manager.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: [
              ColorManager.lightPrimary,
              ColorManager.lightPrimary,
              ColorManager.lightPrimary,
              ColorManager.lightPrimary,
              ColorManager.primary
            ],
            strokeWidth: AppSize.s1,
            backgroundColor: ColorManager.white.withOpacity(OpicityValue.o1),
            pathBackgroundColor:
                ColorManager.white.withOpacity(OpicityValue.o1)),
      ),
    );
  }
}
