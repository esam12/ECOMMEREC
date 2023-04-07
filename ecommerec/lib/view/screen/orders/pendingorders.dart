import 'package:ecommerec/controller/orders/pendingorders_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<PendingOrdersController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: ((context, index) =>
                  CardOrders(orderModel: controller.data[index])),
            ),
          ),
        ),
      ),
    );
  }
}

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
            Text(
              "Order Number : #${orderModel.ordersId}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(
                "Order Type :  ${controller.printTypeOrder(orderModel.ordersType!)}"),
            Text("Order Price : ${orderModel.ordersPrice} \$"),
            Text("Delivery Price : ${orderModel.ordersPricedelivery} \$"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(orderModel.ordersPaymentmethod!)}"),
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
