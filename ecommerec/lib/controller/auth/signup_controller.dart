import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/data/datasource/remote/auth/signup.dart';
import 'package:flutter/cupertino.dart';  
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends LoginController {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  late TextEditingController email, username, phone, password;
  StatusRequest statusRequest = StatusRequest.none;

  SignUpData signupdata = SignUpData(Get.find());
  List data = [];
  @override
  signUp() async {
    var formdata = fromstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupdata.postData(
          username.text, password.text, email.text, phone.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verfiyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Waring",
              middleText: "Phone Number Or Email already Exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }
}
