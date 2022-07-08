import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';

abstract class IOrderService {
  void sendOrderToShop(Map<String, dynamic> order, String userId);
  void subscribeToOrdersStatus(IOrderSubscriber subscriber);
  void unsubscribeFromOrdersStatus(String subscriberId);
  void cancelAllSubscribtions();
  void listenToOrderStatusOnServer(String userId);
  bool canModifyOrder();
}
