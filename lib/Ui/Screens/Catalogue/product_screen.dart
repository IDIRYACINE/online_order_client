import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Ui/Components/buttons.dart';
import 'package:online_order_client/Ui/Components/product_components.dart';
import 'package:online_order_client/Ui/Components/forms.dart';
import 'package:online_order_client/Ui/Themes/messages.dart';
import 'package:provider/provider.dart';

class CategoryproductsScreen extends StatefulWidget {
  final Product _product;
  const CategoryproductsScreen(this._product, {Key? key}) : super(key: key);

  @override
  _CategoryproductsScreenState createState() => _CategoryproductsScreenState();
}

class _CategoryproductsScreenState extends State<CategoryproductsScreen> {
  int _currentSizeIndex = 0;
  int _units = 1;

  late ThemeData theme;

  String getSize(int index) {
    return widget._product.getSize(index);
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
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaultTolerantImage(src: widget._product.getImageUrl()),
              const Spacer(),
              Center(
                  child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const Divider(
                    thickness: 2.0,
                  ),
                  UnitButton(
                    fillBackground: true,
                    initialCount: 1,
                    onCountChange: setUnitsCount,
                  ),
                ],
              )),
              Text(
                widget._product.getName(),
                style: theme.textTheme.headline1,
              ),
              Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    widget._product.getPrice(_currentSizeIndex).toString(),
                    style: theme.textTheme.headline2,
                  )),
              Text(
                widget._product.getDescription(),
                style: theme.textTheme.subtitle1,
              ),
              OptionalItemsWidget(
                Messages.sizesTitle,
                itemCount: widget._product.getSizesCount(),
                itemPopulater: getSize,
                onItemPressed: selectSize,
              ),
              const Spacer(),
              SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: MaterialButton(
                    textColor: theme.backgroundColor,
                    color: theme.primaryColor,
                    shape: const StadiumBorder(),
                    child: const Text(
                      Messages.buttonAddProduct,
                    ),
                    onPressed: () {
                      Provider.of<HelpersProvider>(context, listen: false)
                          .cartHelper
                          .addCartItem(
                              CartItem(
                                  product: widget._product, quantity: _units),
                              context);
                    },
                  ))
            ],
          ),
        ));
  }
}
