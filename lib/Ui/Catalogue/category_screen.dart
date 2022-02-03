import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Providers/catalogue_provider.dart';
import 'package:online_order_client/Ui/Components/components.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    CatalogueProvider catalogueProvider =
        Provider.of<CatalogueProvider>(context);

    return Scaffold(
        backgroundColor: Colors.red[50],
        body: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
          ),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return CategoryWidget(catalogueProvider.getCategory(index));
            },
            separatorBuilder: (context, index) => Divider(
              color: parseColor("#F9DCC4"),
              height: 10,
              thickness: 5,
            ),
            itemCount: catalogueProvider.getCategoriesCount(),
          ),
        ));
  }
}
