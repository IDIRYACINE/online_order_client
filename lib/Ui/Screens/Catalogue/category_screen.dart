import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Catalogue/catalogue_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Domain/Catalogue/optional_item.dart';
import 'package:online_order_client/Ui/Components/product_components.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/product_widget.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final double bodyPadding = 16.0;
  final double fixedCategoryWidth = 100;
  final double spaceBetweenProducts = 10.0;
  final int categoriesScrollerFlex = 1;
  final int productsScrollerFlex = 2;
  final int previewHeaderFlex = 1;
  final int previewBodyFlex = 9;
  final int productsFlex = 1;
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ValueNotifier<int> _selectedCategoryIndex = ValueNotifier(0);
  final BoxConstraints productsConstraints =
      const BoxConstraints(minWidth: 130, maxWidth: 150);

  @override
  Widget build(BuildContext context) {
    CatalogueHelper catalogueHelper =
        Provider.of<HelpersProvider>(context, listen: false).catalogueHelper;

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
                      categoriesTitle,
                      minItemWidth: widget.fixedCategoryWidth,
                      itemCount: catalogueHelper.getCategoriesCount(),
                      itemPopulater: (int index) {
                        Category category = catalogueHelper.getCategory(index);
                        return OptionalItem(category.getName());
                      },
                      onItemPressed: (int index) {
                        _selectedCategoryIndex.value = index;
                        return _selectedCategoryIndex.value == index;
                      },
                    )),
                Expanded(
                    flex: goldenRatioFlexLarge,
                    child: ValueListenableBuilder<int>(
                        valueListenable: _selectedCategoryIndex,
                        builder: (context, categoryIndex, child) {
                          Category category =
                              catalogueHelper.getCategory(categoryIndex);

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
                                          onTap: () {},
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
                                            ConstrainedBox(
                                              constraints: productsConstraints,
                                              child: ProductWidget(
                                                  category.getProduct(
                                                      productIndex:
                                                          productIndex)),
                                            ),
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
