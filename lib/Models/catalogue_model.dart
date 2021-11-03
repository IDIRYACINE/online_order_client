import 'package:flutter/foundation.dart';
import 'package:online_order_client/Models/Products/iproduct.dart';
import 'package:online_order_client/Models/Products/products_factory.dart';

class CatalogueModel with ChangeNotifier {
  final ProductsFactory _productsManager = ProductsFactory();
  final int _categoryMaxProductDisplay = 5;
  late List<String> _categories;
  final ProductsMap _products = {};

  CatalogueModel() {
    _loadCategoriesInitProducts();
  }

  Future<void> _loadCategoriesInitProducts() async {
    _categories = await _productsManager.getCategories();
    String categoryName;
    for (int i = 0; i < _categories.length; i++) {
      categoryName = _categories[i];
      _products[categoryName] = await _productsManager.getProducts(
          productCategory: categoryName,
          productsCount: _categoryMaxProductDisplay);
    }
  }

  IProduct getProduct({required int categoryId, required int productId}) {
    String categoryName = _categories[categoryId];

    return _products[categoryName]![productId];
  }

  String getCategoryName({required int categoryId}) {
    return _categories[categoryId];
  }

  int getCategoriesCount() {
    return _categories.length;
  }
}
