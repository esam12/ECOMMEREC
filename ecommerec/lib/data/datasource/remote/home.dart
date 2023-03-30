import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class HomeData {
  late CRUD crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLinkApi.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String searchdata) async {
    var response = await crud.postData(AppLinkApi.search, {"search":searchdata});
    return response.fold((l) => l, (r) => r);
  }
}
