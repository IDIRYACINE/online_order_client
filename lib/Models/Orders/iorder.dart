import 'package:online_order_client/Models/Products/iproduct.dart';

abstract class IOrder {
  void sendOrderToShop({required List<IProduct> products});
  String getOrderStatus({required String id});
  String getOrderDetails();
}
