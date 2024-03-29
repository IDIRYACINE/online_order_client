class OrderStatus {
  static const String noOrder = "noOrder";
  static const String waiting = "waiting";
  static const String confirmed = "confirmed";
  static const String onDelivery = "onDelivery";
  static const String delivered = "delivered";

  static const String noOrderTitle = "pas de commande";
  static const String waitingTitle = "attendre";
  static const String confirmedTitle = "confirmé";
  static const String onDeliveryTitle = "à la livraison";
  static const String deliveredTitle = "livrer";

  static const Map<String, int> _states = {
    waiting: 0,
    confirmed: 1,
    onDelivery: 2,
    delivered: 3,
    noOrder: -1
  };

  static int getStateRank(String state) => _states[state]!;
}
