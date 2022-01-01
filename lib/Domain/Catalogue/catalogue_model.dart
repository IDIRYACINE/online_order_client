import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Infrastructure/Database/products_mapper.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

class CatalogueModel {
  late ProductsMapper _productsManager;
  final int _categoryMaxProductDisplay = 5;
  late CategoryMap _categories;

  Future<void> initCategories() async {
    _productsManager = ServicesProvider().productsMapper;
    _categories = await _productsManager.getCategories();
    for (Category category in _categories) {
      await category.loadProducts(productsCount: _categoryMaxProductDisplay);
    }
  }

  Category getCategory({required int categoryIndex}) {
    return _categories[categoryIndex];
  }

  int getCategoriesCount() {
    return _categories.length;
  }
}
