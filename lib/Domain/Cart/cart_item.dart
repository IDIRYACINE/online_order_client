import 'package:online_order_client/Domain/Cart/icart_item.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';

class CartItem implements ICartItem {
  late String _id;
  late Product _product;
  late int _quantity;
  late double _price;
  late String _size;
  late List<String> _sizes;
  CartItem(
      {required String id, required Product product, required int quantity}) {
    _id = id;
    _product = product;
    _quantity = quantity;
    _price = _quantity * _product.getPrice(0);
    _sizes = _product.getSizes();
  }

  @override
  String getId() {
    return _id;
  }

  @override
  String getName() {
    return _product.getName();
  }

  @override
  Map<String, dynamic> getOnlineMap() {
    return {'name': _product.getName(), 'quantity': _quantity, 'size': _size};
  }

  @override
  double getPrice() {
    return _price;
  }

  @override
  int getQuantity() {
    return _quantity;
  }

  @override
  String getThumbnailUrl() {
    return _product.getImageUrl();
  }

  @override
  List<String> getSizes() {
    return _sizes;
  }

  @override
  void setSize(int sizeIndex) {
    _size = _sizes[sizeIndex];
  }
}
