import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:online_order_client/Ui/Orders/Controller.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
  
}