import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Cart/cart_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Cart/cart.dart';
import 'package:online_order_client/Ui/Cart/cart_item_widget.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Color color = parseColor("#FFB5A7");

  @override
  Widget build(BuildContext context) {
    CartHelper _cartHelper = Provider.of<HelpersProvider>(context).cartHelper;
    NavigationProvider _navigation = Provider.of<NavigationProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const CustomTitle("Cart ", 35),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CartItemWidget(_cartHelper.getProduct(index), color);
              },
              separatorBuilder: (context, index) =>
                  Divider(thickness: 3, color: parseColor("#F9DCC4")),
              itemCount: _cartHelper.getCartItemCount()),
          Text("Number of items : " + _cartHelper.getCartItemCount().toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          Text("Total price : ${_cartHelper.getTotalPrice()} \$",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          SizedBox(
            height: 40,
            width: 180,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: parseColor("#FFB5A7"),
              ),
              label: const Text('Deliver It'),
              icon: const Icon(Icons.send_outlined),
              onPressed: () {
                if (_cartHelper.getCartItemCount() > 0) {
                  _navigation.navigateToDeliveryAddressScreen(context, () {
                    _cartHelper.placeOrder(context);
                  }, replace: true);
                }
              },
              autofocus: true,
            ),
          ),
        ],
      ),
    );
  }
}
