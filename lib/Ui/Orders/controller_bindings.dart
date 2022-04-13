import 'package:get/get.dart';
import 'package:online_order_client/Ui/Orders/controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
}
