// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:online_order_client/Infrastructure/Authentication/authentication_service.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/Database/idatabase.dart';
import 'package:online_order_client/Infrastructure/Database/products_database.dart';
import 'package:online_order_client/Infrastructure/Database/products_mapper.dart';
import 'package:online_order_client/Infrastructure/Orders/iorder_service.dart';
import 'package:online_order_client/Infrastructure/Orders/order_service.dart';
import 'package:online_order_client/Infrastructure/Permissions/ipermissions_service.dart';
import 'package:online_order_client/Infrastructure/Permissions/permissions_service.dart';
import 'package:online_order_client/Infrastructure/Server/firebase_service.dart';
import 'package:online_order_client/Infrastructure/Server/ionline_data_service.dart';
import 'package:online_order_client/Infrastructure/UserData/customer_data_synchroniser.dart';
import 'package:online_order_client/Infrastructure/UserData/icustomer_data_synchroniser.dart';

class ServicesProvider {
  static final ServicesProvider _instance = ServicesProvider._();
  static const String localHost = "192.168.1.6";
  static const String nodeJsHost = "https://orsnodejs.herokuapp.com";
  static String databaseUrl =
      "https://online-order-client-default-rtdb.europe-west1.firebasedatabase.app/";
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
  late final ICustomerDataSynchroniser _customerDataSynchroniser;
  late final IPermissionsService _permissionsService;

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
    _authenticationService =
        FirebaseAuthenticationService(FirebaseAuth.instance);
    _orderService = OrderService(_serverAcess);
    _productsDatabase = ProductsDatabase(_serverAcess);
    _productsMapper = ProductsMapper(_productsDatabase);
    _customerDataSynchroniser = CustomerDataSynchroniser(nodeJsHost);
    _permissionsService = PermissionsService();
  }

  Future<void> _initServerAcess() async {
    DatabaseReference _databaseReference = FirebaseDatabase.instanceFor(
            app: Firebase.app(), databaseURL: databaseUrl)
        .ref();

    _serverAcess =
        FireBaseServices(FirebaseStorage.instance, _databaseReference);
  }

  Future<void> _useTestMode() async {
    databaseUrl = "http://$localHost:9000/?ns=online-order-client";
    FirebaseAuth.instance.useAuthEmulator(localHost, 9099);
    FirebaseStorage.instance.useStorageEmulator(localHost, 9199);
  }

  IAuthenticationService get authenticationService => _authenticationService;
  IOnlineServerAcess get serverAcessService => _serverAcess;
  IOrderService get orderService => _orderService;
  IProductsDatabase get productDatabase => _productsDatabase;
  ProductsMapper get productsMapper => _productsMapper;
  IPermissionsService get permissionsService => _permissionsService;
  ICustomerDataSynchroniser get customerSynchroniser =>
      _customerDataSynchroniser;
}
