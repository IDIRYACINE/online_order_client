import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Ui/Components/product_widget.dart';

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
      Text(widget._category.getName()),
      Container(
        decoration: const BoxDecoration(),
        height: 170,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductWidget(
                widget._category.getProduct(productIndex: index));
          },
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          itemCount: widget._category.getProductCount() + 1,
        ),
      ),
    ]);
  }
}
