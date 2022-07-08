import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Catalogue/catalogue_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  final Category category;
  final int index;
  const CategoryWidget(
    this.category,
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    CatalogueHelper catalogueHelper =
        Provider.of<HelpersProvider>(context, listen: false).catalogueHelper;

    ThemeData theme = Theme.of(context);
    NavigationProvider navigation =
        Provider.of<NavigationProvider>(context, listen: false);

    return InkResponse(
      onTap: () {
        catalogueHelper.selectCategory(widget.index);

        navigation.navigateToCategory(context);
      },
      child: Card(
        elevation: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: FaultTolerantImage(
              widget.category.getImageUrl(),
              height: double.maxFinite,
              fit: BoxFit.fitHeight,
            )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Text(widget.category.getName(),
                            style: theme.textTheme.bodyText1),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0, bottom: 8.0),
                        child: Text(
                          'Articles :${widget.category.getProductCount()}',
                          style: theme.textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
