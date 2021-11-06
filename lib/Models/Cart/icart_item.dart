abstract class ICartItem {
  String getId();
  String getName();
  double getPrice();
  int getQuantity();
  String getThumbnailUrl();
  Map<String, dynamic> getOnlineMap();
}
