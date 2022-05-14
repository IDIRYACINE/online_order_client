import 'package:online_order_client/Domain/Catalogue/product_model.dart';

class CartItem {
  late Product _product;
  late int _quantity;
  late double _price;
  late String _size;
  late int _selectedSizeIndex;

  CartItem(
      {required Product product, int quantity = 1, int selectedSizeIndex = 0}) {
    _product = product;
    _quantity = quantity;
    _selectedSizeIndex = selectedSizeIndex;
    _price = _product.getPrice(selectedSizeIndex);
    _size = _product.getSize(selectedSizeIndex);
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
    return _price * _quantity;
  }

  int getQuantity() {
    return _quantity;
  }

  void setQuantity(int quantity) {
    _quantity = quantity;
  }

  String getThumbnailUrl() {
    return _product.getImageUrl();
  }

  String getSize(int index) {
    return _product.getSize(index);
  }

  void setSize(int sizeIndex) {
    _size = _product.getSize(sizeIndex);
    _price = _product.getPrice(sizeIndex);
  }

  Product getProduct() {
    return _product;
  }

  int getSelectedSizeIndex() {
    return _selectedSizeIndex;
  }
}
