import 'package:online_order_client/Domain/Orders/iorder.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';

abstract class IOrderService {
  void sendOrderToShop(IOrder order);
  void subscribeToOrdersStatus(IOrderSubscriber subscriber);
  void unsubscribeFromOrdersStatus(String subscriberId);
  void cancelAllSubscribtions();
  void listenToOrderStatusOnServer();
}
