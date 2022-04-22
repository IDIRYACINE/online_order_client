import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Catalogue/product_model.dart';
import 'package:online_order_client/Ui/Catalogue/product_units_popup.dart';
import 'package:online_order_client/Ui/Components/shared_components.dart';
import 'package:online_order_client/Ui/Components/product_widget.dart';

class CategoryproductsScreen extends StatefulWidget {
  final Product _product;
  const CategoryproductsScreen(this._product, {Key? key}) : super(key: key);

  @override
  _CategoryproductsScreenState createState() => _CategoryproductsScreenState();
}

class _CategoryproductsScreenState extends State<CategoryproductsScreen> {
  int currentindex = 0;
  int count = 0;

  Future<void> displayProductUnitsPoupUp(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[50],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: ProductUnitsPopUp(widget._product, parseColor("#FFB5A7")),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTitle(widget._product.getName()),
          PicturesHolder(widget._product),
          Divider(
            color: parseColor("#FCD5CE"),
            height: 10,
            thickness: 5,
          ),
          const SizedBox(height: 20),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget._product.getDescription(),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Pacifico",
                      overflow: TextOverflow.ellipsis,
                    ),
                    softWrap: true,
                  ))),
          const SizedBox(height: 20),
          PricesTable(widget._product),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 180,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: parseColor("#FFB5A7"),
                ),
                label: const Text('ADD To Cart'),
                icon: const Icon(Icons.dinner_dining_rounded),
                onPressed: () async {
                  await displayProductUnitsPoupUp(context);
                },
              ),
            ),
           
          ]),
        ],
      ),
    ));
  }
}

class PicturesHolder extends StatelessWidget {
  final Product _product;

  const PicturesHolder(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      height: 120,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            ProductPicture(_product.getDescriptionImageUrl(index)),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: _product.getDescrpitionImagesCount(),
      ),
    );
  }
}

class PricesTable extends StatelessWidget {
  final Product _product;
  const PricesTable(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  textAlign: TextAlign.center,

                ),
                const Text(
                  'Prices',
                  style: TextStyle(fontSize: 35, fontFamily: "Lobster"),
                  textAlign: TextAlign.center,
                ),
              ]),
          TableRow(
            children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Text(
                _product.getSize(index),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25, fontFamily: "Lobster",
                ),
              ),
              itemCount: _product.getSizesCount(),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Text(
                "${_product.getPrice(index)}\$",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25, fontFamily: "Pacifico"),
              ),
              itemCount: _product.getPricesCount(),
            ),
          ]),
        ]);
  }
}
