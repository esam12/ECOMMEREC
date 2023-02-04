import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class FavoriteData {
  late CRUD crud;

  FavoriteData(this.crud);

  addFavorite(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLinkApi.addFav, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLinkApi.removeFav, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
