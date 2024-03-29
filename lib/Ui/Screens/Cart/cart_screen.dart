import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Cart/cart_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Components/Buttons/buttons_default.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

import 'cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  final double maxCartItemHieght = 300;
  final double screenPadding = 15.0;
  final int totalPriceFlex = 1;
  final int cartItemsFlex = 5;
  final int checkoutFlex = 1;
  final double itemSpeperatorHieght = 10;

  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ThemeData theme;
  final BoxConstraints itemConstraints =
      const BoxConstraints(minHeight: 100, maxHeight: 150);
  @override
  Widget build(BuildContext context) {
    CartHelper _cartHelper = Provider.of<HelpersProvider>(context).cartHelper;
    theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(widget.screenPadding),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: widget.cartItemsFlex,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 100, maxHeight: 150),
                        child: CartItemWidget(_cartHelper.getProduct(index)));
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: widget.itemSpeperatorHieght),
                  itemCount: _cartHelper.getCartItemCount())),
          Expanded(
            flex: widget.totalPriceFlex,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cartTotalPrice, style: theme.textTheme.headline2),
                  Text("${_cartHelper.getTotalPrice()} $labelCurrency",
                      style: theme.textTheme.headline2)
                ]),
          ),
          Expanded(
            flex: widget.checkoutFlex,
            child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: DefaultButton(
                  width: double.infinity,
                  text: buttonDelivery,
                  onPressed: () {
                    if (_cartHelper.getCartItemCount() == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Le panier est vide")));
                      return;
                    }
                    _cartHelper.placeOrder(context);
                  },
                )),
          )
        ],
      ),
    );
  }
}
