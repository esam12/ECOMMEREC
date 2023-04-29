import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class DetailsData {
  late CRUD crud;

  DetailsData(this.crud);

  getDetailsData(String id) async {
    var response = await crud.postData(AppLinkApi.detailsorders, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  
}
