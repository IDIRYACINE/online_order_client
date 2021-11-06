import 'package:online_order_client/Models/Cart/icart_item.dart';
import 'package:online_order_client/Models/Products/iproduct.dart';

class CartItem implements ICartItem {
  late String _id;
  late IProduct _product;
  late int _quantity;
  late double _price;
  CartItem(
      {required String id, required IProduct product, required int quantity}) {
    _id = id;
    _product = product;
    _quantity = quantity;
    _price = _quantity * _product.getPrice();
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
    return {'name': _product.getName(), 'quantity': _quantity};
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
}
