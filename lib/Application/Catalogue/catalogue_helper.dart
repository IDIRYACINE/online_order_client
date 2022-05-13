import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_order_client/Domain/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/product_widget.dart';

class CatalogueHelper {
  final CatalogueModel _catalogueModel;
  final int _maxProductsPreview = 5;
  late Category _selectedCategory;
  CatalogueHelper(this._catalogueModel);

  Category getCategory(int categoryIndex) {
    return _catalogueModel.getCategory(categoryIndex: categoryIndex);
  }

  int getCategoriesCount() {
    return _catalogueModel.getCategoriesCount();
  }

  int previewProductCount(int categoryIndex) {
    int productCount = getCategory(categoryIndex).getProductCount();
    productCount =
        productCount > _maxProductsPreview ? _maxProductsPreview : productCount;
    return productCount;
  }

  Future<void> initCategories() async {
    await _catalogueModel.initCategories();
    _selectedCategory = _catalogueModel.getCategory(categoryIndex: 0);
  }

  void setSelectedCategory(int categoryIndex) {
    _selectedCategory =
        _catalogueModel.getCategory(categoryIndex: categoryIndex);
  }

  final BoxConstraints _defaultProductWidgetConstraints =
      const BoxConstraints(minWidth: 130, maxWidth: 150);

  Widget productWidgetBuilder(BuildContext context, int productIndex,
      [BoxConstraints? productConstraints]) {
    return ConstrainedBox(
        constraints: productConstraints ?? _defaultProductWidgetConstraints,
        child: ProductWidget(
            _selectedCategory.getProduct(productIndex: productIndex)));
  }
}
