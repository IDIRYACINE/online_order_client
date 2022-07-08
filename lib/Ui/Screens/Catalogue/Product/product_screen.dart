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

  final int imageFlex = 1;
  final int productFlex = 2;

  final int productNameFlex = 1;
  final int productPriceFlex = 1;
  final int productDescriptionFlex = 1;

  const ProductsScreen(this.cartItem, {Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ValueNotifier<int> currentSizeIndex = ValueNotifier(0);
  ValueNotifier<int> units = ValueNotifier(1);
  late ThemeData theme;
  late Product product;

  VoidCallback? toggleLastSelectedSize;

  OptionalItem getSize(int index) {
    return OptionalItem(product.getSize(index));
  }

  void selectSize(int index, VoidCallback selfToggle) {
    if (toggleLastSelectedSize != null) {
      toggleLastSelectedSize!();
    }

    toggleLastSelectedSize = selfToggle;
    currentSizeIndex.value = index;
  }

  void setUnitsCount(int count) {
    units.value = count;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    product = widget.cartItem.getProduct();
    units.value = widget.cartItem.getQuantity();

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
                    color: theme.colorScheme.secondaryVariant,
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
              Expanded(
                  flex: widget.imageFlex,
                  child: FaultTolerantImage(
                    product.getImageUrl(),
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),
              Expanded(
                flex: widget.productFlex,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Divider(
                            thickness: widget.dividerThickness,
                          ),
                          UnitButton(
                            fillBackground: true,
                            initialCount: units.value,
                            onCountChange: setUnitsCount,
                          ),
                        ],
                      )),
                      Text(
                        product.getName(),
                        style: theme.textTheme.headline1,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: ValueListenableBuilder<int>(
                              valueListenable: units,
                              builder: (context, newUnits, child) {
                                return ValueListenableBuilder<int>(
                                    valueListenable: currentSizeIndex,
                                    builder: (context, newSize, child) {
                                      return Text(
                                        "${product.getPrice(newSize) * newUnits} $labelCurrency",
                                        style: theme.textTheme.headline2,
                                      );
                                    });
                              })),
                      Flexible(
                        flex: widget.productDescriptionFlex,
                        child: Text(
                          product.getDescription(),
                          style: theme.textTheme.subtitle1,
                          maxLines: widget.productDescriptionMaxLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: widget.optionalItemsYpadding,
                              bottom: widget.optionalItemsYpadding),
                          child: OptionalItemsWidget(
                            title: Text(
                              sizesTitle,
                              style: theme.textTheme.headline2,
                            ),
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
                            widget.cartItem.setSize(currentSizeIndex.value);
                            widget.cartItem.setQuantity(units.value);
                            Provider.of<HelpersProvider>(context, listen: false)
                                .cartHelper
                                .addCartItem(widget.cartItem, context);
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
