import 'package:ecommerec/controller/myfavoritedata_controller.dart';
import 'package:ecommerec/core/constant/color.dart';
import 'package:ecommerec/core/functions/translatedatabase.dart';
import 'package:ecommerec/data/model/myvaforitemodel.dart';
import 'package:ecommerec/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavoriteList extends GetView<MyFavoriteDataControllerImp> {
  final MyFavoriteModel itemsModel;
  const CustomFavoriteList({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
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
                      "${itemsModel.itemsPrice} \$",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans"),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.deleteFromFavorite(
                              itemsModel.favoriteId.toString());
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: AppColor.primaryColor,
                        ))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
