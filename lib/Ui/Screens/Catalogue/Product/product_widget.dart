import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  final Product product;

  const ProductWidget(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    NavigationProvider navigation = Provider.of<NavigationProvider>(context);

    return InkResponse(
      onTap: () {
        navigation.navigateToProductDetails(
            context, CartItem(product: widget.product));
      },
      child: Card(
        elevation: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: FaultTolerantImage(
              widget.product.getImageUrl(),
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
                        child: Text(widget.product.getName(),
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
                          '${widget.product.getPrice().toString()} $labelCurrency',
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
