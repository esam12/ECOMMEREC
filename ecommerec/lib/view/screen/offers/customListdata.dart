import 'package:ecommerec/controller/favorite_controller.dart';
import 'package:ecommerec/controller/items_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/constant/imageasset.dart';
import 'package:ecommerec/core/functions/translatedatabase.dart';
import 'package:ecommerec/data/model/itemsmodel.dart';
import 'package:ecommerec/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListData extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListData({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemsId}",
                      child: Image.asset(
                        "${AppLinkApi.imagestatic}/${itemsModel.itemsImage}",
                        width: 170,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${translatDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Rating 3.5"),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 25,
                          child: Row(
                            children: [
                              ...List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${itemsModel.itemsPriceDiscount} \$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans"),
                        ),
                        GetBuilder<FavoriteController>(
                            builder: (controller) => IconButton(
                                  color: AppColor.primaryColor,
                                  icon: Icon(controller
                                              .isFavorite[itemsModel.itemsId] ==
                                          1
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined),
                                  onPressed: () {
                                    if (controller
                                            .isFavorite[itemsModel.itemsId] ==
                                        1) {
                                      controller.setFavorite(
                                          itemsModel.itemsId, "0");
                                      controller.removeFavorite(
                                          itemsModel.itemsId.toString());
                                    } else {
                                      controller.setFavorite(
                                          itemsModel.itemsId, "1");
                                      controller.addFavorite(
                                          itemsModel.itemsId.toString());
                                    }
                                  },
                                ))
                      ],
                    )
                  ]),
            ),
            if (itemsModel.itemsDiscount != 0)
              Positioned(
                top: -1,
                left: -2,
                child: Image.asset(
                  AppImageAsset.sale,
                  width: 40,
                ),
              )
          ],
        ),
      ),
    );
  }
}
