typedef ProductsMap = Map<String, List<IProduct>>;

abstract class IProduct {
  String getName();
  String getDescription();
  double getPrice();
  String getImageUrl();
  String getExtras();
  String formatProductOrder();
}
