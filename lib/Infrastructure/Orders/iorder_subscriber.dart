abstract class IOrderSubscriber {
  void notify(String orderStatus, [bool rebuild = true]);
  String getId();
}
