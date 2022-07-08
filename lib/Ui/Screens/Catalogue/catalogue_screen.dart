import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Catalogue/catalogue_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Domain/Catalogue/optional_item.dart';
import 'package:online_order_client/Ui/Components/product_components.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class CatalogueScreen extends StatefulWidget {
  final double bodyPadding = 16.0;
  final double fixedCategoryWidth = 100;
  final double spaceBetweenProducts = 10.0;
  final int categoriesScrollerFlex = 1;
  final int productsScrollerFlex = 2;
  final int previewHeaderFlex = 1;
  final int previewBodyFlex = 9;
  final int productsFlex = 1;
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  final ValueNotifier<int> selectedCategoryIndex = ValueNotifier(0);

  late CatalogueHelper catalogueHelper;
  late NavigationProvider navigationProvider;
  VoidCallback? toggleLastSelectedCategory;

  void onCategoryPressed(int index, VoidCallback toggleSelfCallback) {
    if (toggleLastSelectedCategory != null) {
      toggleLastSelectedCategory!();
    }

    toggleLastSelectedCategory = toggleSelfCallback;
    catalogueHelper.setSelectedCategory(index);
    // Rebuilding widget will cancel the execution of the function !
    selectedCategoryIndex.value = index;
  }

  OptionalItem categoryPopulater(int index) {
    Category category = catalogueHelper.selectCategory(index);
    return OptionalItem(category.getName(), category.getImageUrl());
  }

  void seeAllProducts(BuildContext context) {
    navigationProvider.navigateToCategory(context);
  }

  void seeAllCategories(BuildContext context) {
    navigationProvider.navigateToAllCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    catalogueHelper =
        Provider.of<HelpersProvider>(context, listen: false).catalogueHelper;
    navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);

    final ThemeData theme = Theme.of(context);

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(widget.bodyPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: golenRationFlexSmall,
                    child: OptionalItemsWidget(
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              categoriesTitle,
                              style: theme.textTheme.headline2,
                            ),
                            InkResponse(
                              onTap: () {
                                seeAllCategories(context);
                              },
                              child: Text(
                                seeAllLabel,
                                style: theme.textTheme.overline,
                              ),
                            )
                          ]),
                      minItemWidth: widget.fixedCategoryWidth,
                      itemCount: catalogueHelper.getCategoriesPreviewCount(),
                      itemPopulater: categoryPopulater,
                      onItemPressed: onCategoryPressed,
                    )),
                Expanded(
                    flex: goldenRatioFlexLarge,
                    child: ValueListenableBuilder<int>(
                        valueListenable: selectedCategoryIndex,
                        builder: (context, categoryIndex, child) {
                          Category category =
                              catalogueHelper.selectCategory(categoryIndex);

                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: spaceDefault),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          category.getName(),
                                          style: theme.textTheme.headline2,
                                        ),
                                        InkResponse(
                                          onTap: () {
                                            seeAllProducts(context);
                                          },
                                          child: Text(
                                            seeAllLabel,
                                            style: theme.textTheme.overline,
                                          ),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    flex: goldenRatioFlexLarge,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: catalogueHelper
                                            .previewProductCount(categoryIndex),
                                        itemBuilder: (context, productIndex) =>
                                            catalogueHelper
                                                .productPreviewWidgetBuilder(
                                                    context, productIndex),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                                width: widget
                                                    .spaceBetweenProducts))),
                              ]);
                        })),
              ],
            )));
  }
}
