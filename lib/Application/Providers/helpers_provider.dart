import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:online_order_client/Application/Authentication/authentication_error_handler.dart';
import 'package:online_order_client/Application/Authentication/authentication_helper.dart';
import 'package:online_order_client/Application/Cart/cart_helper.dart';
import 'package:online_order_client/Application/Catalogue/catalogue_helper.dart';
import 'package:online_order_client/Application/DeliveryAddress/delivery_address.dart';
import 'package:online_order_client/Domain/Cart/cart.dart';
import 'package:online_order_client/Domain/Catalogue/catalogue_model.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Infrastructure/Authentication/AuthenticationProviders/facebook_authentication.dart';
import 'package:online_order_client/Infrastructure/Exceptions/server_exceptions.dart';
import 'package:online_order_client/Infrastructure/UserData/customer_data_synchroniser.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

import 'dart:developer' as dev;

class HelpersProvider with ChangeNotifier {
  late CatalogueHelper _catalogueHelper;
  late CartHelper _cartHelper;
  late ServicesProvider services;
  late DeliveryAddress _addressHelper;
  late AuthenticationHelper _authHelper;

  Future<bool> initApp() async {
    try {
      await Firebase.initializeApp();
      services = ServicesProvider();
      await services.initialiaze();
      await services.productDatabase.connect();
      _catalogueHelper = CatalogueHelper(CatalogueModel());

      await _catalogueHelper.initCategories();
      _cartHelper = CartHelper(Cart(), services.orderService,
          services.authenticationService, notifyListeners);
      await _initProfile();

      await services.permissionsService.requestGpsPermission();

      services.authenticationService.accountIsActive().then((value) {
        if (value) {
          services.orderService.listenToOrderStatusOnServer(
              services.authenticationService.getId());
        }
      });
    } on LocalDatabaseNotFound catch (_) {
      throw LocalDatabaseNotFound();
    } catch (e) {
      dev.log(e.toString());
    }

    return true;
  }

  Future<void> _initProfile() async {
    ProfileModel profile = ProfileModel();
    await profile.loadProfile();
    _authHelper = AuthenticationHelper(
        profile,
        services.authenticationService,
        FacebookAuthentication(),
        AuthenticationErrorHandler(),
        CustomerDataSynchroniser(ServicesProvider.nodeJsHost));

    _addressHelper = DeliveryAddress(profile.getAddress());
  }

  CatalogueHelper get catalogueHelper => _catalogueHelper;

  CartHelper get cartHelper => _cartHelper;
  DeliveryAddress get addressHelper => _addressHelper;

  AuthenticationHelper get authHelper => _authHelper;
}
