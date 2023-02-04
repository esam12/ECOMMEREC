import 'package:ecommerec/data/datasource/remote/items.dart';
import 'package:ecommerec/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  initialData() {
    itemsModel = Get.arguments['itemsmodel'];
  }

  List subItemsColors = [
    {"name": "Red", "id": 1, "active": '0'},
    {"name": "Black", "id": 2, "active": '1'},
    {"name": "Green", "id": 3, "active": '0'},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
