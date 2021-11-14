import 'dart:ffi';

import 'package:online_order_client/Utility/Database/idatabase.dart';
import 'package:online_order_client/Utility/Database/products_database.dart';
import 'package:online_order_client/Utility/service_factory.dart';

import '../../Models/Products/iproduct.dart';
import '../../Models/Products/product_model.dart';

class ProductsMapper {
  late final IProductsDatabase _database;

  ProductsMapper(IProductsDatabase productsDatabase) {
    _database = productsDatabase;
  }

  Future<List<IProduct>> getProducts(
      {required String productCategory, required int productsCount}) async {
    List<IProduct> products = [];

    ResultSet productsResultSet = await _database.loadProducts(
        category: productCategory, count: productsCount);

    for (int i = 0; i < productsResultSet.length; i++) {
      products.add(_mapResultSetToProduct(productsResultSet[i]));
    }
    return products;
  }

  Future<List<String>> getCategories() async {
    List<String> categories = [];
    ResultSet categoriesResultSet = await _database.loadCategories();
    for (int i = 0; i < categoriesResultSet.length; i++) {
      categories.add(_mapResultSetToCategory(categoriesResultSet[i]));
    }

    return categories;
  }

  IProduct _mapResultSetToProduct(QueryResult queryResult) {
    String name = queryResult['Name'] as String;
    String imageUrl = queryResult['Image_URL'] as String;
    String description = queryResult['Description'] as String;

    String rawSize = queryResult['Size'] as String;
    String rawPrice = queryResult['Price'] as String;

    List<String> sizes = rawSize.split(",");
    List<double> price = _rawStringToList(rawPrice);

    IProduct product = Product(name, description, imageUrl, price, sizes);

    return product;
  }

  List<double> _rawStringToList(String raw) {
    List<double> result = [];
    List<String> rawList = raw.split(",");
    for (String item in rawList) {
      result.add(double.parse(item));
    }
    return result;
  }

  String _mapResultSetToCategory(QueryResult queryResult) {
    return queryResult['Name'] as String;
  }
}
