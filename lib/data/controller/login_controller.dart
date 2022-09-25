import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../domain/models/user_model.dart';
import '../../presentation/Home/home_screen.dart';
import '../../presentation/resources/strings_manager.dart';
import '../local_data/booking_database.dart';

class LoginController extends GetxController {
  bool vis = true;

  RxBool loading = true.obs;
  BookingDatabase db = BookingDatabase.instance;
  void sendLoginData({required String? email, required String? password}) {
    isExist(email: email, password: password).then((value) {
      if (value) {
        SharedPreferencesHelper.setLoginValue(value);
        Get.offAll(() => HomeScreen());
      } else {
        Get.snackbar(
          AppStrings.oops,
          AppStrings.notValidLoginData,
        );
      }
    });
  }

  Future<bool> isExist(
      {required String? email, required String? password}) async {
    List<UserModel> allUsers = await db.readAllUsers();
    bool isExist = false;
    for (var user in allUsers) {
      if (user.email == email && user.password == password) {
        isExist = true;
      } else {
        isExist = false;
      }
    }
    return isExist;
  }

  void eyetToggle() {
    vis = !vis;
    update();
  }
}
