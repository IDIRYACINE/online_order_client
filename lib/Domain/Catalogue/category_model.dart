// ignore_for_file: unused_field, prefer_final_fields

import 'package:online_order_client/Infrastructure/Database/products_mapper.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

import 'product_model.dart';

typedef CategoryMap = List<Category>;

class Category {
  late String _id;
  late String _name;
  late String _imageUrl;
  late int _productCount;
  int _loadedProducts = 0;
  final List<Product> _products = [];

  Category(
      {required String id,
      required String name,
      required String imageUrl,
      required int productsCount}) {
    _id = id;
    _name = name;
    _imageUrl = imageUrl;
    _productCount = productsCount;
  }

  String getName() {
    return _name;
  }

  String getImageUrl() {
    return _imageUrl;
  }

  int getProductCount() {
    return _loadedProducts;
  }

  Product getProduct({required int productIndex}) {
    return _products[productIndex];
  }

  Future<void> loadProducts({required int productsCount}) async {
    ProductsMapper mapper = ServicesProvider().productsMapper;

    List<Product> loadedProducts = await mapper.getProducts(
        categoryId: _id,
        startIndex: _loadedProducts,
        productsCount: productsCount);

    for (Product product in loadedProducts) {
      _products.add(product);
    }
  }
}
