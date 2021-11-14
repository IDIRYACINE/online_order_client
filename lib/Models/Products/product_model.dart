import 'iproduct.dart';

class Product implements IProduct {
  final String _name, _description, _imageUrl;
  final List<double> _prices;
  final List<String> _sizes;

  Product(
      this._name, this._description, this._imageUrl, this._prices, this._sizes);

  @override
  String getDescription() {
    return _description;
  }

  @override
  String getImageUrl() {
    return _imageUrl;
  }

  @override
  String getName() {
    return _name;
  }

  @override
  double getPrice(int size) {
    return _prices[size];
  }

  @override
  List<String> getSizes() {
    return _sizes;
  }
}
