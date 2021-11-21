typedef ProductMap = Map<String, List<Product>>;

class Product {
  final String _name, _description, _imageUrl;
  final List<double> _prices;
  final List<String> _sizes;

  Product(
      this._name, this._description, this._imageUrl, this._prices, this._sizes);

  String getDescription() {
    return _description;
  }

  String getImageUrl() {
    return _imageUrl;
  }

  String getName() {
    return _name;
  }

  double getPrice(int size) {
    return _prices[size];
  }

  List<String> getSizes() {
    return _sizes;
  }
}
