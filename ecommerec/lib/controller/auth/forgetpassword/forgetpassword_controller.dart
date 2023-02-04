import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/core/functions/handlingdata.dart';
import 'package:ecommerec/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  //goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();
  late TextEditingController email;
  CheckEmailData checkemaildata = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkemail() async {
    var formdata = fromstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkemaildata.postData(email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.verifycode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Waring",
              middleText:
                  "The email does not exist, please check if the email is available.");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  // @override
  // goToVerifyCode() {
  //   var formdata = fromstate.currentState;
  //   if (formdata!.validate()) {
  //     Get.offNamed(AppRoute.verifycode);
  //   }
  // }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
