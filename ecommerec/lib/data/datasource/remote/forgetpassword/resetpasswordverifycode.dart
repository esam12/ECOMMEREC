import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class ResetPassVerifyCodeData {
  late CRUD crud;

  ResetPassVerifyCodeData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinkApi.resetpassVerifycode, {
      "email": email,
      "verifycode": verifycode ,
    });

    return response.fold((l) => l, (r) => r);
  }
}
