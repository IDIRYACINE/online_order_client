import 'package:online_order_client/Models/Products/category_model.dart';
import 'package:online_order_client/Models/Products/product_model.dart';
import 'package:online_order_client/Utility/Database/products_mapper.dart';
import 'package:online_order_client/Utility/service_factory.dart';

class CatalogueModel {
  static final CatalogueModel _catalogueModel = CatalogueModel._();
  final ProductsMapper _productsManager = ServiceFactory().productsMapper;
  final int _categoryMaxProductDisplay = 5;
  late CategoryMap _categories;
  late ProductMap _products;

  factory CatalogueModel() {
    return _catalogueModel;
  }

  CatalogueModel._();

  Future<void> loadCategoriesInitProducts() async {
    _categories = await _productsManager.getCategories();
    List<Product> _tempProducts;

    for (Category category in _categories) {
      _tempProducts = await _productsManager.getProducts(
          productCategory: category.getName(),
          productsCount: _categoryMaxProductDisplay);
      _products[category.getName()] = _tempProducts;
    }
  }

  Product getProduct({required int categoryId, required int productId}) {
    String categoryName = _categories[categoryId].getName();

    return _products[categoryName]![productId];
  }

  Category getCategoryName({required int categoryId}) {
    return _categories[categoryId];
  }

  int getCategoriesCount() {
    return _categories.length;
  }
}
