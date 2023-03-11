import 'package:ecommerec/controller/cart_controller.dart';
import 'package:ecommerec/core/class/statusrequest.dart';
import 'package:ecommerec/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartController controller = Get.put(CartController());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int countitems = 0;
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
   countitems = await controller.getcountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
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
