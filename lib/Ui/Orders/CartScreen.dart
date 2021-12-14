import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Cart/cart.dart';
import 'package:online_order_client/Ui/Orders/cart_item_widget.dart';
import 'package:online_order_client/Ui/shared/Components.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Cart cart = Cart();
  final Color color = parseColor("#FFB5A7");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ElemTitle(context, "Cart ", 35),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CartItemWidget(cart.getProduct(productId: index), color);
              },
              separatorBuilder: (context, index) =>
                  Divider(thickness: 3, color: parseColor("#F9DCC4")),
              itemCount: cart.getProductsCount()),
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
                setState(() {
                  cart.placeOrder();
                  cart.clearCart();
                });
              },
              autofocus: true,
            ),
          ),
        ],
      ),
    );
  }
}
