import 'package:flutter/material.dart';
import 'package:online_order_client/Application/Catalogue/catalogue_helper.dart';
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final int gridCrossAxisCount = 2;
  final double gridCrossAxisSpacing = spaceDefault;
  final double gridMainAxisSpacing = 5.0;

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late CatalogueHelper catalogueHelper;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    catalogueHelper =
        Provider.of<HelpersProvider>(context, listen: false).catalogueHelper;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Card(
            elevation: 4.0,
            color: theme.cardColor,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: theme.colorScheme.secondaryContainer,
                )),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(spaceDefault),
        child: ListView.builder(
            itemCount: catalogueHelper.selectCategory().getProductCount(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, productIndex) =>
                catalogueHelper.productWidgetBuilder(context, productIndex)),
      ),
    );
  }
}
