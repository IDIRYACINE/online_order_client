import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Cart/cart_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Ui/Themes/messages.dart';
import 'package:provider/provider.dart';

import 'cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  VoidCallback? _sendOrder;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    CartHelper _cartHelper = Provider.of<HelpersProvider>(context).cartHelper;
    NavigationProvider _navigation = Provider.of<NavigationProvider>(context);
    theme = Theme.of(context);

    if (_cartHelper.getCartItemCount() > 0) {
      _sendOrder = () {
        _navigation.navigateToDeliveryAddressScreen(context, () {
          _cartHelper.placeOrder(context);
        }, replace: false);
      };
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return CartItemWidget(_cartHelper.getProduct(index));
                  },
                  separatorBuilder: (context, index) => const Spacer(flex: 1),
                  itemCount: _cartHelper.getCartItemCount())),
          Text(
            "${Messages.cartTotalPrice} : ${_cartHelper.getTotalPrice()} \$",
            textAlign: TextAlign.center,
            style: theme.textTheme.headline2,
          ),
          Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: MaterialButton(
                color: theme.primaryColor,
                height: 50.0,
                shape: const StadiumBorder(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Messages.buttonDelivery,
                      style: theme.textTheme.bodyText1,
                    )
                  ],
                ),
                onPressed: _sendOrder,
              ))
        ],
      ),
    );
  }
}
