import 'package:ecommerec/controller/orders/archive_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/constant/routes.dart';
import 'package:ecommerec/data/model/ordersmodel.dart';
import 'package:ecommerec/view/widget/orders/dialograting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersArchive extends GetView<ArchiveOrdersController> {
  final OrdersModel orderModel;
  const CardOrdersArchive({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColor.primaryColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${orderModel.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy(orderModel.ordersDatetime, "yyyy-MM-dd").fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Text(
                "Order Type :  ${controller.printTypeOrder(orderModel.ordersType!)}"),
            Text("Order Price : ${orderModel.ordersPrice} \$"),
            Text("Delivery Price : ${orderModel.ordersPricedelivery} \$"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(orderModel.ordersPaymentmethod!)}"),
            Text(
                "Orders Status : ${controller.printOrderStatus(orderModel.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price  : ${orderModel.ordersTotalprice} \$",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.detailsOrders,
                        arguments: {"ordersModel": orderModel});
                  },
                  color: AppColor.primaryColor,
                  child: const Text(
                    "Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                if (orderModel.ordersRating == "0")
                  MaterialButton(
                    onPressed: () {
                      showDialogRating(context, orderModel.ordersId!);
                    },
                    color: AppColor.primaryColor,
                    child: const Text(
                      "Rating",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
