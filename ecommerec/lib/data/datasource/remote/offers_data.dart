import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class OffersData {
  late CRUD crud;
  OffersData(this.crud);
  getOffersData() async {
    var response = await crud.postData(AppLinkApi.offfers, {});
    return response.fold((l) => l, (r) => r);
  }
}
