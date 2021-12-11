abstract class ICartItem {
  String getId();
  String getName();
  double getPrice();
  String getSize(int index);
  void setSize(int sizeIndex);
  int getQuantity();
  String getThumbnailUrl();
  Map<String, dynamic> getOnlineMap();
}
