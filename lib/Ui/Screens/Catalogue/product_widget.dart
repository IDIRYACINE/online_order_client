import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final Color? backgroundColor;
  final double cardBottomPadding;
  final double dividerThickness;
  final double productNameTopPadding;

  const ProductWidget(
    this.product, {
    Key? key,
    this.backgroundColor,
    this.dividerThickness = 4,
    this.productNameTopPadding = 4,
    this.cardBottomPadding = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    NavigationProvider navigation = Provider.of<NavigationProvider>(context);

    return InkResponse(
      onTap: () {
        navigation.navigateToProductDetails(context, product);
      },
      child: Card(
          color: backgroundColor ?? theme.cardColor,
          elevation: 4.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: goldenRatioFlexLarge,
                child: FaultTolerantImage(
                  product.getImageUrl(),
                ),
              ),
              Flexible(
                flex: goldenRatioFlexMeduim,
                child:
                    Text(product.getName(), style: theme.textTheme.headline2),
              ),
              Flexible(
                flex: golenRatioFlexExtraSmall,
                child: Padding(
                  padding: EdgeInsets.only(bottom: cardBottomPadding),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product.getPrice(0).toString(),
                          style: theme.textTheme.headline2,
                        ),
                        const Text(currencySymbol)
                      ]),
                ),
              ),
            ],
          )),
    );
  }
}
