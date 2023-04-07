import 'package:ecommerec/controller/checkout_controller.dart';
import 'package:ecommerec/core/class/handlingdataview.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/constant/imageasset.dart';
import 'package:ecommerec/view/widget/checkout/cartchoosedelivery.dart';
import 'package:ecommerec/view/widget/checkout/cartpaymentmethod.dart';
import 'package:ecommerec/view/widget/checkout/cartshippingaddress.dart';
import 'package:ecommerec/view/widget/checkout/sectiontitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controllermain = Get.put(CheckOutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckOut"),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColor.secondColor,
          child: const Text(
            "CheckOut",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          onPressed: () {
            controllermain.checkout();
          },
        ),
      ),
      body: GetBuilder<CheckOutController>(
        builder: ((controller) => HandlingData(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(20),
                child: ListView(children: [
                  const SectionTitle(title: "Choose Payment Method"),
                  const SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        controller.paymentAddressMethod("0");
                      },
                      child: CartPaymentMethod(
                          title: "Cash On Delivery",
                          isActive:
                              controller.paymentMethod == "0" ? true : false)),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      controller.paymentAddressMethod("1");
                    },
                    child: CartPaymentMethod(
                        title: "Payment Cards",
                        isActive:
                            controller.paymentMethod == "1" ? true : false),
                  ),
                  const SizedBox(height: 20),
                  const SectionTitle(title: "Choose Delivery Type"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.deliveryTypeMehtod("0");
                        },
                        child: CartChooseDelivery(
                            title: "Delivery",
                            isActive:
                                controller.deliveryType == "0" ? true : false,
                            image: AppImageAsset.delivery),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          controller.deliveryTypeMehtod("1"); // استلام وليس توصيل
                        },
                        child: CartChooseDelivery(
                            title: "Drive Thru",
                            isActive:
                                controller.deliveryType == "1" ? true : false,
                            image: AppImageAsset.drivethru),
                      ),
                    ],
                  ),
                  if (controller.deliveryType == "0")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const SectionTitle(title: "Shipping Address"),
                        const SizedBox(height: 10),
                        ...List.generate(
                          controller.data.length,
                          (index) => InkWell(
                            onTap: () {
                              controller.shippingAddressMethod(
                                  controller.data[index].addressId!);
                            },
                            child: CartShippingAddress(
                                title: "${controller.data[index].addressName}",
                                subtitle:
                                    "${controller.data[index].addressCity} "
                                    "${controller.data[index].addressStreet}",
                                isActive: controller.addressId ==
                                        controller.data[index].addressId
                                    ? true
                                    : false),
                          ),
                        )
                      ],
                    ),
                ]),
              ),
            )),
      ),
    );
  }
}
