import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class ItemsData {
  late CRUD crud;

  ItemsData(this.crud);

  getData(String id, String usersid) async {
    var response = await crud
        .postData(AppLinkApi.items, {"id": id.toString(), "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
