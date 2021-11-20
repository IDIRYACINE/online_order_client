import 'package:online_order_client/Models/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Models/Products/category_model.dart';
import 'package:online_order_client/Models/Products/product_model.dart';

class Catalogue {
  final CatalogueModel _catalogueModel = CatalogueModel();

  Future<void> initCategories() async {
    await _catalogueModel.loadCategoriesInitProducts();
  }

  Product getProduct(int categoryId, int productId) {
    return _catalogueModel.getProduct(
        categoryId: categoryId, productId: productId);
  }

  Category getCategory(int categoryId) {
    return _catalogueModel.getCategoryName(categoryId: categoryId);
  }

  int getCategoriesCount() {
    return _catalogueModel.getCategoriesCount();
  }
}
