import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Ui/Components/buttons.dart';
import 'package:online_order_client/Ui/Components/forms.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem _cartItem;

  const CartItemWidget(this._cartItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartItemState();
}

class _CartItemState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Card(
        elevation: 4.0,
        color: theme.cardColor,
        child: ListTile(
          shape: const StadiumBorder(),
          leading: FaultTolerantImage(
            widget._cartItem.getThumbnailUrl(),
          ),
          title: Text(widget._cartItem.getName()),
          subtitle: Text(widget._cartItem.getPrice().toString()),
          trailing: UnitButton(
            initialCount: widget._cartItem.getQuantity(),
            onCountChange: widget._cartItem.setQuantity,
          ),
        ));
  }
}
