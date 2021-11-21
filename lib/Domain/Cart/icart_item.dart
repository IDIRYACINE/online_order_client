abstract class ICartItem {
  String getId();
  String getName();
  double getPrice();
  List<String> getSizes();
  void setSize(int sizeIndex);
  int getQuantity();
  String getThumbnailUrl();
  Map<String, dynamic> getOnlineMap();
}
