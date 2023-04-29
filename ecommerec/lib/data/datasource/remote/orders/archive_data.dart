import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class ArchiveOrdersData {
  late CRUD crud;
  ArchiveOrdersData(this.crud);

  getArchiveData(String usersid) async {
    var response =
        await crud.postData(AppLinkApi.archiveorders, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }

  getRating(String id, String rating, String comment) async {
    var response = await crud.postData(AppLinkApi.ratingorders,
        {"ordersid": id, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
