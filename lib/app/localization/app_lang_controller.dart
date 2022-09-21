// ignore_for_file: unnecessary_null_comparison

 
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'local_storage/local_storage.dart';

class AppLanguage extends GetxController {
  var appLocale = 'ar';

  @override
  void onInit() async {
    super.onInit();
    LocaleStorage localStorage = LocaleStorage();

    await localStorage.langSelected == null
        ? appLocale = 'ar'
        : appLocale = await localStorage.langSelected;

    update();
    Get.updateLocale(Locale(appLocale));
  }

  void changeLanguage(String? type) async {
    LocaleStorage localStorage = LocaleStorage();

    if (appLocale == type) {
      return;
    }
    if (type == 'ar') {
      appLocale = 'ar';
      localStorage.saveLangToDisk('ar');
    } else {
      appLocale = 'en';
      localStorage.saveLangToDisk('en');
    }
    update();
  }
}
