import 'package:flutter/material.dart';
import 'package:online_order_client/Models/catalogue_model.dart';
import 'package:provider/provider.dart';

class DefaultButton extends StatefulWidget {
  Color? _color;
  double? _width;
  double? _height;
  double? _raduis;
  late int _categorieID;

  DefaultButton(
      {Key? key,
      Color? color = Colors.red,
      double? width = double.infinity,
      double? height = 70,
      double? raduis = 0,
      required int categorieID,
      required Function? function})
      : super(key: key) {
    _color = color;
    _width = width;
    _height = height;
    _raduis = raduis;
    _categorieID = categorieID;
  }

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  late Function _function;

  @override
  Widget build(BuildContext context) {
    final CatalogueModel _model = Provider.of<CatalogueModel>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget._raduis!),
        color: widget._color,
      ),
      width: widget._width,
      height: widget._height,
      child: MaterialButton(
        onPressed: () {
          _function;
        },
        child: Text(
          _model.getCategoryName(categoryId: widget._categorieID),
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Dancing', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
