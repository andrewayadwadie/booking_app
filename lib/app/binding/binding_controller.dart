import 'package:booking_app/data/controller/login_controller.dart';
import 'package:get/get.dart';

 

class IntialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
   
  }
}
