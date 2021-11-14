typedef ProductsMap = Map<String, List<IProduct>>;

abstract class IProduct {
  String getName();
  String getDescription();
  double getPrice(int size);
  String getImageUrl();
  List<String> getSizes();
}
