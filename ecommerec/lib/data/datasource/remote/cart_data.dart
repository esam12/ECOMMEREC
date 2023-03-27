import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class CartData {
  late CRUD crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLinkApi.cartadd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.cartdelete, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountItemsData(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.countitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCartData(String usersid) async {
    var response =
        await crud.postData(AppLinkApi.cartview, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
