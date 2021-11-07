import 'package:online_order_client/Models/Orders/iorder.dart';
import 'package:online_order_client/Utility/Orders/iorder_subscriber.dart';

abstract class IOrderService {
  void sendOrderToShop(IOrder order);
  void subscribeToOrdersStatus(IOrderSubscriber subscriber);
  void unsubscribeFromOrdersStatus(String subscriberId);
  void cancelAllSubscribtions();
  void listenToOrderStatusOnServer();
}
