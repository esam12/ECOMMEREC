import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class MyFavoriteData {
  late CRUD crud;

  MyFavoriteData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLinkApi.favoriteview, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response =
        await crud.postData(AppLinkApi.deletefromfavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
