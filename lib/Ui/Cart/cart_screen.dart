import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/catalogue_provider.dart';
import 'package:online_order_client/Ui/Cart/cart_item_widget.dart';
import 'package:online_order_client/Ui/shared/components.dart';
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
    CatalogueProvider catalogueProvider =
        Provider.of<CatalogueProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          elemTitle(context, "Cart ", 35),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CartItemWidget(
                    catalogueProvider.getProduct(productId: index), color);
              },
              separatorBuilder: (context, index) =>
                  Divider(thickness: 3, color: parseColor("#F9DCC4")),
              itemCount: catalogueProvider.getCartItemCount()),
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
                  catalogueProvider.placeOrder();
                  catalogueProvider.clearCart();
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
