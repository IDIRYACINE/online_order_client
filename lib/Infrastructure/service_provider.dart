// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:online_order_client/Infrastructure/Authentication/authentication_service.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/Database/idatabase.dart';
import 'package:online_order_client/Infrastructure/Database/products_database.dart';
import 'package:online_order_client/Infrastructure/Database/products_mapper.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_service.dart';
import 'package:online_order_client/Infrastructure/Orders/order_service.dart';
import 'package:online_order_client/Infrastructure/Server/firebase_service.dart';
import 'package:online_order_client/Infrastructure/Server/ionline_data_service.dart';

class ServicesProvider {
  static final ServicesProvider _instance = ServicesProvider._();
  static const String localHost = "192.168.1.6";
  bool _isInit = false;
  ServicesProvider._();

  factory ServicesProvider() {
    return _instance;
  }

  late final IAuthenticationService _authenticationService;
  late final IOnlineServerAcess _serverAcess;
  late final IOrderService _orderService;
  late final IProductsDatabase _productsDatabase;
  late final ProductsMapper _productsMapper;

  Future<void> initialiaze() async {
    if (_isInit) {
      return;
    }
    //await _useTestMode();
    await _initServices();
    _isInit = true;
  }

  Future<void> _initServices() async {
    await _initServerAcess();
    _authenticationService = FirebaseAuthenticationService(
        FirebaseAuth.instance, FirebaseFirestore.instance);
    _orderService = OrderService(_serverAcess);
    _productsDatabase = ProductsDatabase(_serverAcess);
    _productsMapper = ProductsMapper(_productsDatabase);
  }

  Future<void> _initServerAcess() async {
    // http://192.168.1.6:9000/?ns=online-order-client";
    //https://online-order-client-default-rtdb.europe-west1.firebasedatabase.app/
    DatabaseReference _databaseReference = FirebaseDatabase(
            databaseURL:
                "https://online-order-client-default-rtdb.europe-west1.firebasedatabase.app")
        .reference();

    _serverAcess =
        FireBaseServices(FirebaseStorage.instance, _databaseReference);
  }

  Future<void> _useTestMode() async {
    FirebaseAuth.instance.useAuthEmulator(localHost, 9099);
    FirebaseFirestore.instance.useFirestoreEmulator(localHost, 8080);
    FirebaseStorage.instance.useStorageEmulator(localHost, 9199);
  }

  IAuthenticationService get authenticationService => _authenticationService;
  IOnlineServerAcess get serverAcessService => _serverAcess;
  IOrderService get orderService => _orderService;
  IProductsDatabase get productDatabase => _productsDatabase;
  ProductsMapper get productsMapper => _productsMapper;
}
