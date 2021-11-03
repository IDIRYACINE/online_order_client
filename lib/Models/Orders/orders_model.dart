import 'package:online_order_client/Models/Orders/iorder.dart';
import 'package:online_order_client/Models/Products/iproduct.dart';

class OrdersModel implements IOrder {
  static final OrdersModel _ordersModel = OrdersModel._();

  OrdersModel._();
  factory OrdersModel() {
    return _ordersModel;
  }

  @override
  String getOrderDetails() {
    // TODO: implement getOrderDetails
    throw UnimplementedError();
  }

  @override
  String getOrderStatus({required String id}) {
    // TODO: implement getOrderStatus
    throw UnimplementedError();
  }

  @override
  void sendOrderToShop({required List<IProduct> products}) {
    // TODO: implement sendOrderToShop
  }
}
