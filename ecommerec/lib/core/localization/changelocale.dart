import 'package:ecommerec/core/constant/apptheme.dart';
import 'package:ecommerec/core/functions/fcm.dart';
import 'package:ecommerec/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission locationPermission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Warning", "Please turn on the location service !");
    }
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Get.snackbar(
            "Warning", "Please give site permission to Application !");
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      Get.snackbar(
          "Warning", "The application cannot be used without location !");
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    requestPermissionLocation();

    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
