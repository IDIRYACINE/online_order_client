import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';

class CategoryWidget extends StatefulWidget {
  final Category _category;

  const CategoryWidget(this._category, {Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
