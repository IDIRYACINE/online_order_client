import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:online_order_client/Ui/Catalogue/ProductScreen.dart';

class DefaultButton extends StatefulWidget {
  late final Color _color;
  late final double _width;
  late final double _height;
  late final double _raduis;
  late final String _title;

  DefaultButton(
      {Key? key,
      Color? color = Colors.red,
      double? width = double.infinity,
      double? height = 70,
      double? raduis = 0,
      required String title,
      required Function? function})
      : super(key: key) {
    _color = color!;
    _width = width!;
    _height = height!;
    _raduis = raduis!;
    _title = title;
  }

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  late Function _function;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget._raduis),
        color: widget._color,
      ),
      width: widget._width,
      height: widget._height,
      child: MaterialButton(
        onPressed: () {
          _function;
        },
        child: Text(
          widget._title,
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Dancing', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CategoryLIstView extends StatefulWidget {
  const CategoryLIstView({Key? key}) : super(key: key);

  @override
  _CategoryLIstViewState createState() => _CategoryLIstViewState();
}

class _CategoryLIstViewState extends State<CategoryLIstView> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      ElemTitle(context, "Pizza", 30, 3.0),
      Container(
        decoration: const BoxDecoration(),
        height: 170,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => productINFO(),
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          itemCount: 10,
        ),
      ),
    ]);
  }
}

class productINFO extends StatefulWidget {
  @override
  State<productINFO> createState() => _productINFOState();
}

class _productINFOState extends State<productINFO> {
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
              'https://download.vikidia.org/vikidia/fr/images/a/a4/Pizza.jpg',
              fit: BoxFit.cover,
              height: 100.0,
              width: 100.0,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "pizza algeria",
              style: TextStyle(fontFamily: "pacifico"),
            ),
          ),
          CircleAvatar(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryproductsScreen()));
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

Color parseColor(String color) {
  String hex = color.replaceAll("#", "");
  if (hex.isEmpty) hex = "ffffff";
  if (hex.length == 3) {
    hex =
        '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
  }
  Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
  return col;
}

Widget line(double lineHieght, BuildContext context) {
  return Expanded(
    child: Container(
      height: lineHieght,
      color: Colors.black,
    ),
  );
}

Widget CartIcon(int count) {
  return Container(
    child: Stack(children: [
      const Icon(
        Icons.shopping_cart,
        size: 30,
      ),
      Positioned(
        bottom: 13,
        left: 9,
        child: Container(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              child: Text(
                "$count",
                style: const TextStyle(color: Colors.blue, fontSize: 10),
              ),
              radius: 7,
              backgroundColor: Colors.red,
            )),
      ),
    ]),
  );
}

Widget ElemTitle(BuildContext context, String title,
    [double Size = 30, double lineHieght = 3.0]) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8,
    ),
    child: Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Row(children: [
        Text(
          title,
          style: TextStyle(
            fontSize: Size,
            fontWeight: FontWeight.bold,
            fontFamily: "Lobster",
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        line(lineHieght, context),
      ]),
    ),
  );
}

Widget ProductPicture() {
  return Container(
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Image.network(
        'https://download.vikidia.org/vikidia/fr/images/a/a4/Pizza.jpg',
        fit: BoxFit.cover,
        height: 100.0,
        width: 100.0,
      ),
    ),
  );
}

Widget PicturesLV() {
  return Container(
    decoration: const BoxDecoration(),
    height: 120,
    width: double.infinity,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => ProductPicture(),
      separatorBuilder: (context, index) => const SizedBox(width: 5),
      itemCount: 10,
    ),
  );
}

class ProductDescription extends StatefulWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Ingrediant(
          "Olive , fromage , Tomato slides , Shampooning , viand , Tona , Creame Bichamel , la sos Algerian , hachihch"),
    );
  }
}

Widget Ingrediant(String Ingridiant) {
  return Text(
    Ingridiant,
    textAlign: TextAlign.start,
    maxLines: 3,
    style: const TextStyle(
      fontSize: 16,
      fontFamily: "Pacifico",
      overflow: TextOverflow.ellipsis,
    ),
    softWrap: true,
  );
}

Widget PricesTabl() {
  return Table(
      border: TableBorder.all(
          width: 2.7,
          color: parseColor(
              "#FEC89A")), // Allows to add a border decoration around your table
      children: [
        TableRow(
            decoration: BoxDecoration(color: parseColor("#FFB5A7")),
            children: const [
              Text(
                'Sizes',
                style: TextStyle(fontSize: 35, fontFamily: "Lobster"),
              ),
              Text(
                'Mini',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: "Lobster"),
              ),
              Text(
                'Larg',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: "Lobster"),
              ),
              Text(
                'Extra Larg',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontFamily: "Lobster"),
              ),
            ]),
        const TableRow(children: [
          Text(
            'Prices(DA)',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Lobster",
            ),
          ),
          Text(
            "2500\$",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontFamily: "Pacifico"),
          ),
          Text(
            "3000\$",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontFamily: "Pacifico"),
          ),
          Text(
            "3500\$",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontFamily: "Pacifico"),
          ),
        ]),
      ]);
}
