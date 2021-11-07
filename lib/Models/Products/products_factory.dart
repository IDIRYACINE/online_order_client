import 'package:online_order_client/Utility/Database/idatabase.dart';
import 'package:online_order_client/Utility/Database/products_database.dart';

import 'iproduct.dart';
import 'product_model.dart';

class ProductsFactory {
  late final IProductsDatabase _database;

  ProductsFactory({IProductsDatabase? dataSource}) {
    if (dataSource != null) {
      _database = dataSource;
    } else {
      _database = ProductsDatabase();
    }
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
    IProduct product = Product(productMap: queryResult);
    return product;
  }

  String _mapResultSetToCategory(QueryResult queryResult) {
    return queryResult['Name'] as String;
  }
}
