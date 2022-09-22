import 'package:get/get.dart';

import '../../data/controller/login_controller.dart';

 

class IntialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
   
  }
}
