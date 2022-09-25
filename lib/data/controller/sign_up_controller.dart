import '../local_data/booking_database.dart';
import '../../domain/models/user_model.dart';
import '../../presentation/Home/home_screen.dart';
import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../presentation/resources/strings_manager.dart';

class SignupController extends GetxController {
  bool vis = true;

  RxBool loading = true.obs;
  BookingDatabase db = BookingDatabase.instance;
  void sendSignUpData({
    required String? email,
    required String? password,
    required String? name,
    required String? phone,
  }) async {
    isExist(email: email, password: password, name: name, phone: phone)
        .then((value) {
      if (!value) {
        db
            .createUser(UserModel(
                name: name ?? "",
                phone: phone ?? "",
                password: password ?? "",
                email: email ?? "",
                discount: false))
            .then((val) {
          SharedPreferencesHelper.setLoginValue(value);
          Get.offAll(() => HomeScreen());
        });
      } else {
        Get.snackbar(
          AppStrings.oops,
          AppStrings.notValidLoginData,
        );
      }
    });
  }

  Future<bool> isExist({
    required String? email,
    required String? password,
    required String? name,
    required String? phone,
  }) async {
    List<UserModel> allUsers = await db.readAllUsers();
    bool isExist = false;
    for (var user in allUsers) {
      if (user.email == email &&
          user.password == password &&
          user.name == name &&
          user.phone == phone) {
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
