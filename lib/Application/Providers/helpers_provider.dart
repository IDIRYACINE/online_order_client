import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:online_order_client/Application/Cart/cart_helper.dart';
import 'package:online_order_client/Application/DeliveryAddress/delivery_address.dart';
import 'package:online_order_client/Domain/Catalogue/category_model.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

import '../../Domain/Cart/cart.dart';
import '../../Domain/Catalogue/catalogue_model.dart';
import '../../Infrastructure/Authentication/AuthenticationProviders/facebook_authentication.dart';
import '../Authentication/authentication_helper.dart';
import '../Profile/profile_helper.dart';

class HelpersProvider with ChangeNotifier {
  late CatalogueModel _catalogueModel;
  late CartHelper _cartHelper;
  late ServicesProvider services;
  late ProfileHelper _profileHelper;
  late DeliveryAddress _addressHelper;
  late AuthenticationHelper _authHelper;

  HelpersProvider() {
    _catalogueModel = CatalogueModel();
  }

  Future<bool> initApp() async {
    try {
      await Firebase.initializeApp();
      services = ServicesProvider();
      await services.initialiaze();
      await services.productDatabase.connect();
      await _catalogueModel.initCategories();
    } catch (exception) {}
    _cartHelper = CartHelper(Cart(), services.orderService,
        services.authenticationService, notifyListeners);
    await _initProfile();

    _authHelper = AuthenticationHelper(
        services.authenticationService, FacebookAuthentication());

    await services.permissionsService.requestGpsPermission();

    return true;
  }

  Future<void> _initProfile() async {
    ProfileModel profile = ProfileModel();
    await profile.loadProfile();
    _profileHelper = ProfileHelper(
        services.authenticationService, profile, services.customerSynchroniser);
    _addressHelper = DeliveryAddress(profile.getAddress());
  }

  Category getCategory(int categoryIndex) {
    return _catalogueModel.getCategory(categoryIndex: categoryIndex);
  }

  int getCategoriesCount() {
    return _catalogueModel.getCategoriesCount();
  }

  void setUpHelpersContext(BuildContext context) {
    authHelper.setBuildContext(context);
  }

  CartHelper get cartHelper => _cartHelper;
  ProfileHelper get profileHelper => _profileHelper;
  DeliveryAddress get addressHelper => _addressHelper;

  AuthenticationHelper get authHelper => _authHelper;
}
