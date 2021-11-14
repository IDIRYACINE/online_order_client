import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_order_client/Utility/Authentication/authentication_service.dart';
import 'package:online_order_client/Utility/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Utility/Database/idatabase.dart';
import 'package:online_order_client/Utility/Database/products_database.dart';
import 'package:online_order_client/Utility/Database/products_mapper.dart';
import 'package:online_order_client/Utility/Orders/iorder_service.dart';
import 'package:online_order_client/Utility/Orders/order_service.dart';
import 'package:online_order_client/Utility/Server/firebase_service.dart';
import 'package:online_order_client/Utility/Server/ionline_data_service.dart';

class ServiceFactory {
  static final ServiceFactory _instance = ServiceFactory._();
  ServiceFactory._();

  factory ServiceFactory() {
    return _instance;
  }

  late final IAuthenticationService _authenticationService;
  late final IOnlineServerAcess _serverAcess;
  late final IOrderService _orderService;
  late final IProductsDatabase _productsDatabase;
  late final ProductsMapper _productsMapper;

  Future<void> initialiaze() async {
    await _initServicesDependencies();
    await _initServices();
  }

  Future<void> _initServices() async {
    _authenticationService = FirebaseAuthenticationService(
        FirebaseAuth.instance, FirebaseFirestore.instance);
    _serverAcess = FireBaseServices();
    _orderService = OrderService();
    _productsDatabase = ProductsDatabase(_serverAcess);
    _productsMapper = ProductsMapper(_productsDatabase);
  }

  Future<void> _initServicesDependencies() async {
    const String localHost = "192.168.1.9";
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore fire = FirebaseFirestore.instance;
    fire.useFirestoreEmulator(localHost, 8080);
    auth.useAuthEmulator(localHost, 9099);
  }

  IAuthenticationService get authenticationService => _authenticationService;
  IOnlineServerAcess get serverAcessServce => _serverAcess;
  IOrderService get orderService => _orderService;
  IProductsDatabase get productDatabase => _productsDatabase;
  ProductsMapper get productsMapper => _productsMapper;
}
