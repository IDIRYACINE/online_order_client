import 'package:online_order_client/Utility/Database/idatabase.dart';

import 'iproduct.dart';

class ProductModel implements IProduct {
  late String name, description, imageUrl;
  late double price;

  ProductModel({required QueryResult productMap}) {
    name = productMap['Name'] as String;
    imageUrl = productMap['Image_URL'] as String;
    description = productMap['Description'] as String;
    price = double.parse((productMap['Price'] as String));
  }

  @override
  String formatProductOrder() {
    // TODO: implement formatProductOrder
    throw UnimplementedError();
  }

  @override
  String getDescription() {
    return description;
  }

  @override
  String getExtras() {
    // TODO: implement getExtras
    throw UnimplementedError();
  }

  @override
  String getImageUrl() {
    return imageUrl;
  }

  @override
  String getName() {
    return name;
  }

  @override
  double getPrice() {
    return price;
  }
}
