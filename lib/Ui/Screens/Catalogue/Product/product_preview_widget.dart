import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class ProductPreview extends StatelessWidget {
  final Product product;
  final Color? backgroundColor;
  final double cardBottomPadding;
  final double dividerThickness;
  final double productNameTopPadding;
  final int imageFlex = 2;
  final double cardElevation = 8.0;

  const ProductPreview(
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
        navigation.navigateToProductDetails(
            context, CartItem(product: product));
      },
      child: Card(
          color: backgroundColor ?? theme.cardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderCircularRaduis)),
          elevation: cardElevation,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: imageFlex,
                child: FaultTolerantImage(
                  product.getImageUrl(),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                  child: Center(
                child:
                    Text(product.getName(), style: theme.textTheme.bodyText1),
              )),
              const Divider(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: cardBottomPadding),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product.getPrice().toString(),
                          style: theme.textTheme.bodyText1,
                        ),
                        const Text(
                          labelCurrency,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              ),
            ],
          )),
    );
  }
}
