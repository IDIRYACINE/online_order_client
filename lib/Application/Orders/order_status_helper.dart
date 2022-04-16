import 'package:flutter/widgets.dart';
import 'package:online_order_client/Domain/Orders/order_status.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

class OrderStatusProvider with ChangeNotifier implements IOrderSubscriber {
  final String _id = "OrderStatusScreen";
  final _OrderState _stateDelegate = _OrderState();
  String _orderStatus = OrderStatus.waiting;

  OrderStatusProvider() {
    ServicesProvider().orderService.subscribeToOrdersStatus(this);
  }

  void unsbscribeFromStatusStream() {
    ServicesProvider().orderService.unsubscribeFromOrdersStatus(_id);
  }

  @override
  String getId() {
    return _id;
  }

  @override
  void notify(String orderStatus) {
    _orderStatus = orderStatus;
    _stateDelegate.setState(orderStatus);
    notifyListeners();
  }

  String get orderStatus => _orderStatus;

  bool calculateOrderActiveState(String widgetState) {
    return _stateDelegate.isActive(widgetState);
  }
}

class _OrderState {
  String _currentState = OrderStatus.waiting;

  void setState(String state) {
    _currentState = state;
  }

  bool isActive(String widgetState) {
    return OrderStatus.getStateRank(widgetState) <=
        OrderStatus.getStateRank(_currentState);
  }
}
