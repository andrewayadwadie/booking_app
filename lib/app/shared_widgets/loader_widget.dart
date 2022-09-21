import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/values_manager.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppSize.s100,
        width: AppSize.s100,
        child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: [
              ColorManager.lightPrimary,
              ColorManager.lightPrimary,
              ColorManager.lightPrimary,
              ColorManager.lightPrimary,
              ColorManager.primary
            ],
            strokeWidth: 1,
            backgroundColor: ColorManager.white.withOpacity(OpicityValue.o1),
            pathBackgroundColor:
                ColorManager.white.withOpacity(OpicityValue.o1)),
      ),
    );
  }
}
