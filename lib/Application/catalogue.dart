import 'package:online_order_client/Domain/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';

class Catalogue {
  final CatalogueModel _catalogueModel = CatalogueModel();

  Future<void> initCategories() async {
    await _catalogueModel.initCategories();
  }

  Category getCategory(int categoryId) {
    return _catalogueModel.getCategory(categoryIndex: categoryId);
  }

  int getCategoriesCount() {
    return _catalogueModel.getCategoriesCount();
  }
}
