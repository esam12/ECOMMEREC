import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class AddressData {
  late CRUD crud;
  AddressData(this.crud);
  addaddress(String addressName, String usersId, String addressCity,
      String addressStreet, String lat, String long) async {
    var response = await crud.postData(AppLinkApi.addressadd, {
      "name": addressName,
      "usersid": usersId,
      "city": addressCity,
      "street": addressStreet,
      "lat": lat,
      "long": long
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteaddress(String addressId) async {
    var response = await crud.postData(AppLinkApi.addressdelete, {
      "addressid": addressId,
    });
    return response.fold((l) => l, (r) => r);
  }

  editaddress(String addressId, String addressName, String addressCity,
      String addressStreet, String lat, String long) async {
    var response = await crud.postData(AppLinkApi.addressedit, {
      "name": addressName,
      "usersid": addressId,
      "city": addressCity,
      "street": addressStreet,
      "lat": lat,
      "long": long
    });
    return response.fold((l) => l, (r) => r);
  }

  viewaddress(String usersId) async {
    var response =
        await crud.postData(AppLinkApi.addressview, {"usersid": usersId});
    return response.fold((l) => l, (r) => r);
  }
}
