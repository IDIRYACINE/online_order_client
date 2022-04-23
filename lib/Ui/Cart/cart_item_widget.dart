import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Cart/cart_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:provider/provider.dart';

import '../Components/product_widget.dart';

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
    CartHelper _cartHelper = Provider.of<HelpersProvider>(context).cartHelper;

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
                  Text(
                    widget._cartItem.getName(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 3,
                    color: widget._color,
                  ),
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          child: Column(
                            children:  [
                              Text(
                                "Quantity :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                widget._cartItem.getQuantity().toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                        VerticalDivider(
                          width: 8,
                          thickness: 1,
                          color: widget._color,
                        ),
                        Container(
                          width: 90,
                          child: Column(
                            children:  [
                              Text(
                                "Price :",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                widget._cartItem.getPrice().toString() + "\$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )
                            ],
                          ),
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
                    _cartHelper.removeProduct(widget._cartItem);
                  });
                },
                icon: const Icon(Icons.delete)),
          )
        ],
      ),
    );
  }
}
