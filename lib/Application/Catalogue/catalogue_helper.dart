import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:online_order_client/Domain/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/product_widget.dart';

class CatalogueHelper {
  final CatalogueModel _catalogueModel;
  final int _maxProductsPreview = 5;

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
  }
}
