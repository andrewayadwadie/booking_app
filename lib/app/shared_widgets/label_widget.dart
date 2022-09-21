import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/font_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: Get.locale == const Locale('en')
            ? const EdgeInsets.only(left: AppPadding.p12, top: AppPadding.p16)
            : const EdgeInsets.only(right: AppPadding.p12, top: AppPadding.p16),
        child: Text(
          label,
          maxLines: MaxLineValues.max2,
          overflow: TextOverflow.ellipsis,
          style:
              getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        ));
  }
}
