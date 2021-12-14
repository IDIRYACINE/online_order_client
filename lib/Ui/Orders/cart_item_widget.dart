import 'package:flutter/material.dart';
import 'package:online_order_client/Application/catalogue_provider.dart';
import 'package:online_order_client/Domain/Cart/cart.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:provider/provider.dart';

import '../shared/Components.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem _cartItem;
  final Color _color;

  const CartItemWidget(this._cartItem, this._color, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartItemState();
}

class _CartItemState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    CatalogueProvider _catalogue = Provider.of<CatalogueProvider>(context);

    return SizedBox(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
                height: 60,
                width: 60,
                child: ProductPicture(widget._cartItem.getThumbnailUrl())),
          ),
          const VerticalDivider(
            thickness: 3,
            color: Colors.black,
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(widget._cartItem.getName()),
                  Divider(
                    thickness: 3,
                    color: widget._color,
                  ),
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        Column(
                          children: const [Text("Unities")],
                        ),
                        VerticalDivider(
                          width: 8,
                          thickness: 1,
                          color: widget._color,
                        ),
                        Column(
                          children: const [Text("Hrisa")],
                        ),
                        VerticalDivider(
                          width: 8,
                          thickness: 1,
                          color: widget._color,
                        ),
                        Column(
                          children: const [Text("MAyon")],
                        ),
                        VerticalDivider(
                          width: 8,
                          thickness: 1,
                          color: widget._color,
                        ),
                        Column(
                          children: const [Text("Prices")],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 3,
            color: Colors.black,
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    _catalogue.removeProduct(item: widget._cartItem);
                  });
                },
                icon: const Icon(Icons.delete)),
          )
        ],
      ),
    );
  }
}
