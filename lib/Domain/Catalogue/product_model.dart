// ignore_for_file: unused_field

import 'package:flutter/widgets.dart';

typedef ProductMap = Map<String, List<Product>>;

class Product {
  final String _name, _description, _imageUrl;
  final List<double> _prices;
  final List<String> _sizes;
  late final List<String> _descriptionImages;

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

  double getPrice(int index) {
    return _prices[index];
  }

  String getSize(int index) {
    return _sizes[index];
  }

  int getPricesCount() {
    return _prices.length;
  }

  int getSizesCount() {
    return _sizes.length;
  }

  String getDescriptionImageUrl(int index) {
    return _imageUrl;
  }

  int getDescrpitionImagesCount() {
    return 1;
  }
}
