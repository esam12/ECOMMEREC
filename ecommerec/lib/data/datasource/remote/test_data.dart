import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class TestData {
  late CRUD crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLinkApi.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
