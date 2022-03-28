import 'dart:convert';

import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Infrastructure/Database/idatabase.dart';

class ProductsMapper {
  late final IProductsDatabase _database;

  ProductsMapper(IProductsDatabase productsDatabase) {
    _database = productsDatabase;
  }

  Future<List<Product>> getProducts(
      {required String categoryId,
      required int startIndex,
      required int productsCount}) async {
    List<Product> products = [];

    ResultSet productsResultSet = await _database.loadProducts(
        category: categoryId, startIndex: startIndex, count: productsCount);

    for (int i = 0; i < productsResultSet.length; i++) {
      products.add(_mapResultSetToProduct(productsResultSet[i]));
    }
    return products;
  }

  Future<CategoryMap> getCategories() async {
    CategoryMap categories = [];
    Category tempCategory;
    ResultSet categoriesResultSet = await _database.loadCategories();
    for (int i = 0; i < categoriesResultSet.length; i++) {
      tempCategory = _mapResultSetToCategory(categoriesResultSet[i]);
      categories.add(tempCategory);
    }

    return categories;
  }

  Product _mapResultSetToProduct(QueryResult queryResult) {
    String rawSize = queryResult['Size'] as String;
    String rawPrice = queryResult['Price'] as String;

    List<String> sizes = List<String>.from(jsonDecode(rawSize));
    List<double> price = _rawStringToList(rawPrice);

    return Product(
        queryResult['Name'] as String,
        queryResult['Description'] as String,
        queryResult['ImageUrl'] as String,
        price,
        sizes);
  }

  List<double> _rawStringToList(String raw) {
    List<double> result =
        List<String>.from(jsonDecode(raw)).map((e) => double.parse(e)).toList();

    return result;
  }

  Category _mapResultSetToCategory(QueryResult queryResult) {
    return Category(
        id: queryResult['Id'] as String,
        name: queryResult['Name'] as String,
        imageUrl: queryResult['ImageUrl'] as String,
        productsCount: queryResult['ProductsCount'] as int);
  }
}
