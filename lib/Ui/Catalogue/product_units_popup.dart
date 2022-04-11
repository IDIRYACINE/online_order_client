import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Domain/Cart/cart_item.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:provider/provider.dart';

class ProductUnitsPopUp extends StatefulWidget {
  final Color _color;
  final Product _product;

  const ProductUnitsPopUp(
    this._product,
    this._color, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UnitsPopUpState();
}

class _UnitsPopUpState extends State<ProductUnitsPopUp> {
  int _units = 0;
  final Icon _exist = const Icon(Icons.check_circle, color: Colors.green);
  final Icon _notexist = const Icon(
    Icons.circle,
    color: Colors.white,
  );
  bool _isExistHarisa = false;
  bool _isExistMayon = false;
  @override
  Widget build(BuildContext context) {
    HelpersProvider catalogueProvider = Provider.of<HelpersProvider>(context);

    return Form(
        child: Container(
      alignment: Alignment.bottomCenter,
      height: 200,
      width: double.infinity,
      child: Center(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    const Text(
                      "Hrissa",
                      style: TextStyle(fontSize: 26, fontFamily: "Lobster"),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isExistHarisa = !_isExistHarisa;
                        });
                      },
                      icon: _isExistHarisa ? _exist : _notexist,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    const Text(
                      "Mayounez",
                      style: TextStyle(fontSize: 23, fontFamily: "Lobster"),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isExistMayon = !_isExistMayon;
                        });
                      },
                      icon: _isExistMayon ? _exist : _notexist,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    const Text(
                      "Units",
                      style: TextStyle(fontSize: 26, fontFamily: "Lobster"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (_units <= 0) {
                            _units == 0;
                          } else {
                            _units--;
                          }
                        });
                      },
                      child: const Icon(
                        Icons.remove_circle,
                        //   color: Colors.red,
                      ),
                      mini: true,
                      heroTag: 'Unit--',
                      backgroundColor: Colors.red[50],
                      foregroundColor: widget._color,
                    ),
                    Text("$_units"),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          _units++;
                        });
                      },
                      child: const Icon(
                        Icons.add_circle,
                      ),
                      mini: true,
                      heroTag: 'Unit++',
                      foregroundColor: Colors.red[50],
                      backgroundColor: widget._color,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 140,
                height: 40,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: widget._color,
                    ),
                    label: const Text('Confirme'),
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      Navigator.pop(context);
                      catalogueProvider.cartHelper.addCartItem(
                          CartItem(product: widget._product, quantity: _units));
                    }),
              ),
            ]),
      ),
    ));
  }
}
