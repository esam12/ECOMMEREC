import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();

  @override
  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.subscribeToTopic("users");
    FirebaseMessaging.instance.subscribeToTopic("users$userid");
    myServices.sharedPreferences.clear();

    Get.offAllNamed(AppRoute.login);
  }
}
