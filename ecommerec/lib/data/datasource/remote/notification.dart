import 'package:ecommerec/core/class/crud.dart';
import 'package:ecommerec/linkapi.dart';

class NotificationData {
  late CRUD crud;
  NotificationData(this.crud);

  getNotifyData(String userid) async {
    var response =
        await crud.postData(AppLinkApi.notification, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
