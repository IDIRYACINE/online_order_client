abstract class IOrderSubscriber {
  void notify(String orderStatus);
  String getId();
}
