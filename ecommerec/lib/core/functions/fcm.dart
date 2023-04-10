import 'package:ecommerec/controller/orders/pendingorders_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
          alert: true,
          sound: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false);
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print("========================Notification=====================");
    FlutterRingtonePlayer.playNotification();
    Get.snackbar("${remoteMessage.notification!.title}",
        "${remoteMessage.notification!.body}");
    refreshPageNotification(remoteMessage.data);
  });
}

refreshPageNotification(data) {
  if (Get.currentRoute == "/pendingOrders" &&
      data['pagename'] == "refreshorderpending") {
    PendingOrdersController controller = Get.find();
    controller.refreshOrders();
  }
}
