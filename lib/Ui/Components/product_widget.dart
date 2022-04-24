import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  final Product _product;
  const ProductWidget(this._product, {Key? key}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: parseColor("#FFB5A7"),
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(30),
          topEnd: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Image.network(
              widget._product.getImageUrl(),
              fit: BoxFit.cover,
              height: 100.0,
              width: 100.0,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              widget._product.getName(),
              style: const TextStyle(fontFamily: "pacifico"),
            ),
          ),
          CircleAvatar(
              child: IconButton(
                onPressed: () {
                  Provider.of<NavigationProvider>(context, listen: false)
                      .navigateToProductDetails(context, widget._product);
                },
                icon: Icon(
                  Icons.add_circle_rounded,
                  color: parseColor("#FEC89A"),
                ),
              ),
              backgroundColor: parseColor("#F8EDEB"))
        ],
      ),
    );
  }
}

class ProductPicture extends StatelessWidget {
  final String _imageUrl;

  // ignore: use_key_in_widget_constructors
  const ProductPicture(
      [this._imageUrl =
          'https://download.vikidia.org/vikidia/fr/images/a/a4/Pizza.jpg']);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Image.network(
        _imageUrl,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset('assets/images/PizzaLogo.png');
        },
        fit: BoxFit.cover,
        height: 100.0,
        width: 100.0,
      ),
    );
  }
}
