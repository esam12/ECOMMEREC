import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class LoginData {
  late CRUD crud;

  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLinkApi.login, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
