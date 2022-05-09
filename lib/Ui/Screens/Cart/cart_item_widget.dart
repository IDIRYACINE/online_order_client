import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Ui/Components/buttons.dart';
import 'package:online_order_client/Ui/Components/product_widget.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem _cartItem;

  const CartItemWidget(this._cartItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartItemState();
}

class _CartItemState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: const StadiumBorder(),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: ProductPicture(widget._cartItem.getThumbnailUrl()),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(widget._cartItem.getName()),
                  Text(widget._cartItem.getPrice().toString())
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: UnitButton(
                  initialCount: widget._cartItem.getQuantity(),
                  onCountChange: widget._cartItem.setQuantity,
                )),
          ],
        ),
      ),
    );
  }
}
