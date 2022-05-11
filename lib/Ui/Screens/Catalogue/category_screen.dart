import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Domain/Catalogue/optional_item.dart';
import 'package:online_order_client/Ui/Components/product_components.dart';
import 'package:online_order_client/Ui/Screens/Catalogue/product_widget.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final double padding = 16.0;
  final double fixedCategoryWidth = 100;
  final double spaceBetweenPreviewTitle = 00.0;
  final double spaceBetweenProducts = 10.0;
  final int categoriesScrollerFlex = 1;
  final int productsScrollerFlex = 2;
  final int previewHeaderFlex = 1;
  final int previewBodyFlex = 9;
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ValueNotifier<int> _selectedCategoryIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    HelpersProvider catalogueProvider = Provider.of<HelpersProvider>(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(widget.padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: golenRationFlexSmall,
                    child: OptionalItemsWidget(
                      categoriesTitle,
                      minItemWidth: widget.fixedCategoryWidth,
                      itemCount: catalogueProvider.getCategoriesCount(),
                      itemPopulater: (int index) {
                        Category category =
                            catalogueProvider.getCategory(index);
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
                              catalogueProvider.getCategory(categoryIndex);

                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: goldenRatioFlexMeduim,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              widget.spaceBetweenPreviewTitle),
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
                                              style: theme.textTheme.subtitle2,
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Expanded(
                                    flex: goldenRatioFlexLarge,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: (context, productIndex) =>
                                            ProductWidget(category.getProduct(
                                                productIndex: 0)),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                                width: widget
                                                    .spaceBetweenProducts))),
                              ]);
                        })),
                const Spacer()
              ],
            )));
  }
}
