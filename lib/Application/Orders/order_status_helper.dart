import 'package:flutter/widgets.dart';
import 'package:online_order_client/Domain/Orders/order_status.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_subscriber.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

class OrderStatusProvider with ChangeNotifier implements IOrderSubscriber {
  final String _id = "OrderStatusScreen";
  final _OrderState _stateDelegate = _OrderState();
  String _orderStatus = OrderStatus.noOrder;
  bool _isSubscribed = false;

  void subscribeToOrderStatusStream() {
    if (!_isSubscribed) {
      ServicesProvider().orderService.subscribeToOrdersStatus(this);
      _isSubscribed = true;
    }
  }

  void unsbscribeFromStatusStream() {
    ServicesProvider().orderService.unsubscribeFromOrdersStatus(_id);
  }

  @override
  String getId() {
    return _id;
  }

  @override
  void notify(String orderStatus, [bool rebuild = true]) {
    _orderStatus = orderStatus;
    _stateDelegate.setState(orderStatus);
    if (rebuild) {
      notifyListeners();
    }
  }

  String get orderStatus => _orderStatus;

  bool calculateOrderActiveState(String widgetState) {
    return _stateDelegate.isActive(widgetState);
  }

  bool orderExists() {
    return _orderStatus != OrderStatus.noOrder;
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
