import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_order_client/Domain/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/Product/product_preview_widget.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/Product/product_widget.dart';

class CatalogueHelper {
  final CatalogueModel _catalogueModel;
  final int _maxProductsPreview = 20;
  late Category _selectedCategory;
  CatalogueHelper(this._catalogueModel);

  Category getCategory([int? categoryIndex]) {
    if (categoryIndex != null) {
      return _catalogueModel.getCategory(categoryIndex: categoryIndex);
    }
    return _selectedCategory;
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
}
