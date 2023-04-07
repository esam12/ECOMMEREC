import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class CheckOutData {
  late CRUD crud;
  CheckOutData(this.crud);
  getData(Map<String, String> data) async {
    var response = await crud.postData(AppLinkApi.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
