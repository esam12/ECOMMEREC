import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class VerifyCodeSignUp {
  late CRUD crud;

  VerifyCodeSignUp(this.crud);

  postData(String email, String code) async {
    var response = await crud.postData(AppLinkApi.authVerifycode, {
      "email": email,
      "verifycode": code,
    });
    return response.fold((l) => l, (r) => r);
  }

  reSendData(String email) async {
    var response = await crud.postData(AppLinkApi.resendverifycode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
