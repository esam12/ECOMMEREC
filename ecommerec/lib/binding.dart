import 'package:ecommerec/controller/auth/signup_controller.dart';
import 'package:ecommerec/core/class/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.put(CRUD());
  }
}
