import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/Catalogue/optional_item.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Ui/Components/buttons.dart';
import 'package:online_order_client/Ui/Components/product_components.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  final CartItem cartItem;
  final double dividerThickness = 2.0;
  final double appBarElevation = 0.0;
  final double padding = 15.0;
  final double backbuttonPadding = 10.0;
  final double optionalItemsYpadding = 4.0;
  final int productDescriptionMaxLines = 2;

  const ProductsScreen(this.cartItem, {Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int _currentSizeIndex = 0;
  int _units = 1;
  late ThemeData theme;
  late Product product;

  OptionalItem getSize(int index) {
    return OptionalItem(product.getSize(index));
  }

  bool selectSize(int index) {
    _currentSizeIndex = index;
    return _currentSizeIndex == index;
  }

  void setUnitsCount(int count) {
    _units = count;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    product = widget.cartItem.getProduct();
    _units = widget.cartItem.getQuantity();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Card(
              elevation: 4.0,
              color: theme.cardColor,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: theme.colorScheme.primary,
                  )),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(widget.padding),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaultTolerantImage(product.getImageUrl()),
              Flexible(
                child: Center(
                    child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Divider(
                      thickness: widget.dividerThickness,
                    ),
                    UnitButton(
                      fillBackground: true,
                      initialCount: _units,
                      onCountChange: setUnitsCount,
                    ),
                  ],
                )),
              ),
              Flexible(
                  child: Text(
                product.getName(),
                style: theme.textTheme.headline1,
              )),
              Flexible(
                child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Text(
                      "${product.getPrice(_currentSizeIndex)} $labelCurrency",
                      style: theme.textTheme.headline2,
                    )),
              ),
              Flexible(
                child: Text(
                  "product.getDescription()product.getDescription()product.getDescription()product.getDproduct.getDescription()product.getDproduct.getDescription()product.getDescription()product.getDescription()escription()escription()product.getDescription()",
                  style: theme.textTheme.subtitle2,
                  maxLines: widget.productDescriptionMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: widget.optionalItemsYpadding,
                      bottom: widget.optionalItemsYpadding),
                  child: OptionalItemsWidget(
                    sizesTitle,
                    activeItem: widget.cartItem.getSelectedSizeIndex(),
                    itemShape: const RoundedRectangleBorder(),
                    unselectedItemColor: theme.colorScheme.background,
                    itemCount: product.getSizesCount(),
                    itemPopulater: getSize,
                    onItemPressed: selectSize,
                  )),
              Flexible(
                child: DefaultButton(
                  text: buttonAddProduct,
                  width: double.infinity,
                  onPressed: () {
                    widget.cartItem.setSize(_currentSizeIndex);
                    widget.cartItem.setQuantity(_units);
                    Provider.of<HelpersProvider>(context, listen: false)
                        .cartHelper
                        .addCartItem(widget.cartItem, context);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
