import 'package:ecommerec/controller/cart_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/view/widget/cart/buttoncart.dart';
import 'package:ecommerec/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends GetView<CartController> {
  final String price;
  final String discount;
  final String totalprice;
  final String shipping;
  final TextEditingController? controllercoupon;
  final void Function()? onApply;

  const CustomBottomNavigationBar(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.controllercoupon,
      required this.onApply,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                hintText: "Coupon Code ",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomButtonCoupon(
                                textbutton: 'Apply', onPressed: onApply)),
                      ],
                    ),
                  )
                : Container(
                    child: Text(
                      "Coupon Code : ${controller.couponname}",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Price",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$price \$",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Discount",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$discount ",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Shipping",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$shipping ",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: 16, color: AppColor.primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$totalprice \$",
                        style: const TextStyle(
                            fontSize: 16, color: AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CustomButtonCart(
            textbutton: "Order",
            onPressed: (() {
              controller.goToPageCheckOut();
            }),
          )
        ],
      ),
    );
  }
}
