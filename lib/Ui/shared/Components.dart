import 'package:flutter/material.dart';
import 'package:online_order_client/Ui/Catalogue/ProductScreen.dart';
import '../../Domain/Catalogue/category_model.dart';
import '../../Domain/Catalogue/product_model.dart';

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

class CategoryWidget extends StatefulWidget {
  final Category _category;

  const CategoryWidget(this._category, {Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      ElemTitle(context, widget._category.getName(), 30, 3.0),
      Container(
        decoration: const BoxDecoration(),
        height: 170,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductInfo(
                widget._category.getProduct(productIndex: index));
          },
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          itemCount: widget._category.getProductCount() + 1,
        ),
      ),
    ]);
  }
}

class ProductInfo extends StatefulWidget {
  final Product _product;
  const ProductInfo(this._product, {Key? key}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryproductsScreen(widget._product)));
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

Widget line(double lineHieght, BuildContext context) {
  return Expanded(
    child: Container(
      height: lineHieght,
      color: Colors.black,
    ),
  );
}

Widget CartIcon(int count) {
  return Stack(children: [
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
  ]);
}

Widget ElemTitle(BuildContext context, String title,
    [double size = 30, double lineHieght = 3.0]) {
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
            fontSize: size,
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

Widget ProductPicture(
    [String imageUrl =
        'https://download.vikidia.org/vikidia/fr/images/a/a4/Pizza.jpg']) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(30)),
    child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
      height: 100.0,
      width: 100.0,
    ),
  );
}

Widget PicturesLV(Product product) {
  return Container(
    decoration: const BoxDecoration(),
    height: 120,
    width: double.infinity,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          ProductPicture(product.getDescriptionImageUrl(index)),
      separatorBuilder: (context, index) => const SizedBox(width: 5),
      itemCount: product.getDescrpitionImagesCount(),
    ),
  );
}

class ProductDescription extends StatefulWidget {
  final Product _product;

  const ProductDescription(
    this._product, {
    Key? key,
  }) : super(key: key);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Ingrediant(widget._product.getDescription()),
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

Widget PricesTabl(Product product) {
  return Table(
      border: TableBorder.all(
          width: 2.7,
          color: parseColor(
              "#FEC89A")), // Allows to add a border decoration around your table
      children: [
        TableRow(
            decoration: BoxDecoration(color: parseColor("#FFB5A7")),
            children: [
              const Text(
                'Sizes',
                style: TextStyle(fontSize: 35, fontFamily: "Lobster"),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => Text(
                  product.getSize(index),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25, fontFamily: "Lobster"),
                ),
                itemCount: product.getSizesCount(),
              ),
            ]),
        TableRow(children: [
          const Text('Prices(DA)',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Lobster",
              )),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => Text(
              "${product.getPrice(index)}\$",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, fontFamily: "Pacifico"),
            ),
            itemCount: product.getPricesCount(),
          ),
        ]),
      ]);
}

Widget CartItem() {
  return SizedBox(
    height: 100,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(height: 60, width: 60, child: ProductPicture()),
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
                const Text("algeria"),
                Divider(
                  thickness: 3,
                  color: parseColor("#FFB5A7"),
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
                        color: parseColor("#FFB5A7"),
                      ),
                      Column(
                        children: const [Text("Hrisa")],
                      ),
                      VerticalDivider(
                        width: 8,
                        thickness: 1,
                        color: parseColor("#FFB5A7"),
                      ),
                      Column(
                        children: const [Text("MAyon")],
                      ),
                      VerticalDivider(
                        width: 8,
                        thickness: 1,
                        color: parseColor("#FFB5A7"),
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
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        )
      ],
    ),
  );
}
