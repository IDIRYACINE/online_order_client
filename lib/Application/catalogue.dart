import 'package:online_order_client/Models/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Models/Products/iproduct.dart';

class Catalogue {
  static final Catalogue _instance = Catalogue._();
  final CatalogueModel _catalogueModel = CatalogueModel();
  Catalogue._();

  factory Catalogue() {
    return _instance;
  }

  Future<void> initCategories() async {
    await _catalogueModel.loadCategoriesInitProducts();
  }

  IProduct getProduct(int categoryId, int productId) {
    return _catalogueModel.getProduct(
        categoryId: categoryId, productId: productId);
  }

  String getCategoryName(int categoryId) {
    return _catalogueModel.getCategoryName(categoryId: categoryId);
  }

  int getCategoriesCount() {
    return _catalogueModel.getCategoriesCount();
  }
}
