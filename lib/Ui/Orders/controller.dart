import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:online_order_client/Ui/Orders/order_status_screen.dart';

class Controller extends GetxController {
  void sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 1,
      channelKey: 'test channel',
      title: "notification test",
      body: "hello world",
    ));
    AwesomeNotifications().actionStream.listen((event) {
      Get.to(const StatusScreen());
    });
  }
}
