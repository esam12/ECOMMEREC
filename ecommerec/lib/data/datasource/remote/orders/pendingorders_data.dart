import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class PendingOrdersData {
  late CRUD crud;
  PendingOrdersData(this.crud);

  getPendingData(String usersid) async {
    var response =
        await crud.postData(AppLinkApi.pendingorders, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }

   getDeleteData(String ordersid) async {
    var response = await crud.postData(AppLinkApi.deleteorders, {"id": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
