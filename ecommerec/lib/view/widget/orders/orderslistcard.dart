
import 'package:ecommerec/controller/orders/pendingorders_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jiffy/jiffy.dart';

class CardOrders extends GetView<PendingOrdersController> {
  final OrdersModel orderModel;
  const CardOrders({super.key, required this.orderModel});

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
                  onPressed: () {},
                  color: AppColor.primaryColor,
                  child: const Text(
                    "Details",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
