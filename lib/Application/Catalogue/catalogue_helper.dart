import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_order_client/Domain/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/Product/product_preview_widget.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/Product/product_widget.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/category_widget.dart';

class CatalogueHelper {
  final CatalogueModel _catalogueModel;
  final int _maxProductsPreview = 5;
  late Category _selectedCategory;
  CatalogueHelper(this._catalogueModel);

  Category selectCategory([int? categoryIndex]) {
    if (categoryIndex != null) {
      return _catalogueModel.getCategory(categoryIndex: categoryIndex);
    }
    return _selectedCategory;
  }

  Category getCategory(int categoryIndex) {
    return _catalogueModel.getCategory(categoryIndex: categoryIndex);
  }

  int getCategoriesCount() {
    return _catalogueModel.getCategoriesCount();
  }

  int getCategoriesPreviewCount() {
    int count = getCategoriesCount();
    return count < _maxProductsPreview ? count : _maxProductsPreview;
  }

  int previewProductCount(int categoryIndex) {
    int productCount = selectCategory(categoryIndex).getProductCount();
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

  final BoxConstraints _productWidthConstraints =
      const BoxConstraints(minWidth: 130, maxWidth: 180);

  Widget productPreviewWidgetBuilder(BuildContext context, int productIndex,
      [BoxConstraints? productConstraints]) {
    return ConstrainedBox(
        constraints: productConstraints ?? _productWidthConstraints,
        child: ProductPreview(
            _selectedCategory.getProduct(productIndex: productIndex)));
  }

  final BoxConstraints _productHeightConstraints =
      const BoxConstraints(minHeight: 130, maxHeight: 180);

  Widget productWidgetBuilder(BuildContext context, int productIndex,
      [BoxConstraints? productConstraints]) {
    return ConstrainedBox(
        constraints: productConstraints ?? _productHeightConstraints,
        child: ProductWidget(
            _selectedCategory.getProduct(productIndex: productIndex)));
  }

  categoryWidgetBuilder(BuildContext context, int categoryIndex,
      [BoxConstraints? productConstraints]) {
    return ConstrainedBox(
        constraints: productConstraints ?? _productHeightConstraints,
        child: CategoryWidget(getCategory(categoryIndex), categoryIndex));
  }
}
