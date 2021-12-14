import 'package:flutter/material.dart';
import 'package:online_order_client/Domain/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Ui/shared/Components.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CatalogueModel _catalogueModel = CatalogueModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[50],
        body: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
          ),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return CategoryWidget(
                  _catalogueModel.getCategory(categoryIndex: index));
            },
            separatorBuilder: (context, index) => Divider(
              color: parseColor("#F9DCC4"),
              height: 10,
              thickness: 5,
            ),
            itemCount: _catalogueModel.getCategoriesCount(),
          ),
        ));
  }
}
