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

class CategoryproductsScreen extends StatefulWidget {
  final Product product;
  final double dividerThickness = 2.0;
  final double appBarElevation = 0.0;
  final double padding = 15.0;
  final double backbuttonPadding = 10.0;
  final double optionalItemsYpadding = 4.0;
  const CategoryproductsScreen(this.product, {Key? key}) : super(key: key);

  @override
  _CategoryproductsScreenState createState() => _CategoryproductsScreenState();
}

class _CategoryproductsScreenState extends State<CategoryproductsScreen> {
  int _currentSizeIndex = 0;
  int _units = 1;

  late ThemeData theme;

  OptionalItem getSize(int index) {
    return OptionalItem(widget.product.getSize(index));
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
                  icon: const Icon(Icons.arrow_back_ios)),
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
              FaultTolerantImage(widget.product.getImageUrl()),
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
                widget.product.getName(),
                style: theme.textTheme.headline1,
              )),
              Flexible(
                child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Text(
                      widget.product.getPrice(_currentSizeIndex).toString(),
                      style: theme.textTheme.headline2,
                    )),
              ),
              Flexible(
                child: Text(
                  "widget.product.getDescription()",
                  style: theme.textTheme.subtitle1,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: widget.optionalItemsYpadding,
                      bottom: widget.optionalItemsYpadding),
                  child: OptionalItemsWidget(
                    sizesTitle,
                    unselectedItemColor: theme.colorScheme.background,
                    itemCount: widget.product.getSizesCount(),
                    itemPopulater: getSize,
                    onItemPressed: selectSize,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: widget.optionalItemsYpadding,
                      bottom: widget.optionalItemsYpadding),
                  child: OptionalItemsWidget(
                    sizesTitle,
                    itemShape: const RoundedRectangleBorder(),
                    unselectedItemColor: theme.colorScheme.background,
                    itemCount: widget.product.getSizesCount(),
                    itemPopulater: getSize,
                    onItemPressed: selectSize,
                  )),
              Flexible(
                child: DefaultButton(
                  text: buttonDelivery,
                  width: double.infinity,
                  onPressed: () {
                    Provider.of<HelpersProvider>(context, listen: false)
                        .cartHelper
                        .addCartItem(
                            CartItem(product: widget.product, quantity: _units),
                            context);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
