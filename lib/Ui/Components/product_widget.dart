import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final Color? backgroundColor;
  final double imageMaxHeight;
  final double imageMaxWidth;

  const ProductWidget(
    this.product, {
    Key? key,
    this.backgroundColor,
    required this.imageMaxHeight,
    required this.imageMaxWidth,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: SizedBox(
                      height: imageMaxHeight,
                      width: imageMaxWidth,
                      child: FaultTolerantImage(
                        product.getImageUrl(),
                      ))),
              Text(product.getName(), style: theme.textTheme.headline2),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.getPrice(0).toString(),
                      style: theme.textTheme.headline2,
                    ),
                    const Text("da")
                  ])
            ],
          )),
    );
  }
}
