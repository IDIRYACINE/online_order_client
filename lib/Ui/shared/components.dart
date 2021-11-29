import 'dart:ui';
import 'package:flutter/material.dart';
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
      Padding(
        padding: const EdgeInsets.only(
          left: 8,
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Row(children: [
            Text(
              "PIZZAs",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Lobster",
              ),
            ),
            SizedBox(
              width: 2,
            ),
            line()
          ]),
        ),
      ),
      Container(
        decoration: BoxDecoration(),
        height: 170,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => productINFO(),
          separatorBuilder: (context, index) => SizedBox(width: 5),
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
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(30),
          topEnd: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryproductsScreen()));
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

Widget line() {
  return Container(
    height: 1.0,
    width: 200,
    color: Colors.black,
  );
}

Widget CartIcon(int count) {
  return Container(
    child: Stack(children: [
      Icon(
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
                style: TextStyle(color: Colors.blue, fontSize: 10),
              ),
              radius: 7,
              backgroundColor: Colors.red,
            )),
      ),
    ]),
  );
}
