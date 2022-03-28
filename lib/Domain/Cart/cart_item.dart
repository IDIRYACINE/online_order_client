import 'package:online_order_client/Domain/Catalogue/product_model.dart';

class CartItem {
  late Product _product;
  late int _quantity;
  late double _price;
  late String _size = "test";
  late String _sizes;

  CartItem({required Product product, required int quantity}) {
    _product = product;
    _quantity = quantity;
    _price = _quantity * _product.getPrice(0);
    _sizes = _product.getSize(0);
  }

  String getName() {
    return _product.getName();
  }

  Map<String, dynamic> getOnlineMap() {
    return {
      'name': _product.getName(),
      'quantity': _quantity,
      'size': _size,
      'price': _price
    };
  }

  double getPrice() {
    return _price;
  }

  int getQuantity() {
    return _quantity;
  }

  String getThumbnailUrl() {
    return _product.getImageUrl();
  }

  String getSize(int index) {
    return _product.getSize(index);
  }

  void setSize(int sizeIndex) {
    _size = _sizes[sizeIndex];
    _price = _product.getPrice(sizeIndex);
  }
}
