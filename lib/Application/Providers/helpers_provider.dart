import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:online_order_client/Application/Cart/cart_helper.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

import '../../Domain/Cart/cart.dart';
import '../../Domain/Catalogue/catalogue_model.dart';
import '../../Infrastructure/Authentication/AuthenticationProviders/facebook_authentication.dart';
import '../Authentication/authentication_helper.dart';
import '../Profile/profile_helper.dart';

class HelpersProvider with ChangeNotifier {
  late final CatalogueModel _catalogueModel;
  late final CartHelper _cartHelper;
  late final ServicesProvider services;
  late final ProfileHelper _profileHelper;

  HelpersProvider() {
    _catalogueModel = CatalogueModel();
  }

  Future<bool> initApp() async {
    await Firebase.initializeApp();
    services = ServicesProvider();
    await services.initialiaze();
    await services.productDatabase.connect();
    await _catalogueModel.initCategories();

    _cartHelper = CartHelper(
        Cart(), services.orderService, services.authenticationService);

    _profileHelper = ProfileHelper(services.authenticationService);

    return true;
  }

  Category getCategory(int categoryIndex) {
    return _catalogueModel.getCategory(categoryIndex: categoryIndex);
  }

  int getCategoriesCount() {
    return _catalogueModel.getCategoriesCount();
  }

  CartHelper get cartHelper => _cartHelper;
  ProfileHelper get profileHelper => _profileHelper;

  AuthenticationHelper get authHelper => AuthenticationHelper(
      services.authenticationService, FacebookAuthentication());
}
