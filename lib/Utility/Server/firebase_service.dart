import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:online_order_client/Utility/Server/ionline_data_service.dart';

class FireBaseServices implements IOnlineServerAcess {
  static final FireBaseServices _fireBaseServices = FireBaseServices._();

  late final DatabaseReference _firebaseDatabase;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  StreamSubscription? _orderStauts;

  factory FireBaseServices() {
    return _fireBaseServices;
  }

  FireBaseServices._() {
    //https://online-order-client-default-rtdb.europe-west1.firebasedatabase.app
    String url =
        "https://online-order-client-default-rtdb.europe-west1.firebasedatabase.app";
    _firebaseDatabase =
        FirebaseDatabase(app: Firebase.app(), databaseURL: url).reference();
  }

  Future<StreamSubscription> postOrder(
      {required Map<String, dynamic> order}) async {
    if (_orderStauts == null) {
      String phoneMac = 'idir';
      await _firebaseDatabase.child('orders').update(order);
      DatabaseReference _orderRef = _firebaseDatabase.child('orders/$phoneMac');

      _orderStauts = _orderRef.onValue.listen((event) {});
      _orderRef.onChildRemoved.listen((event) {
        if (_orderStauts != null) {
          _orderStauts!.cancel();
        }
      });
    }
    return _orderStauts!;
  }

  @override
  Future<dynamic> fetchData({required String dataUrl}) async {
    dynamic data;
    try {
      data = await _firebaseDatabase
          .child(dataUrl)
          .get()
          .then((value) => value.value);
    } catch (e) {}
    return data;
  }

  @override
  Future<void> postData({required String dataUrl, required data}) async {
    _firebaseDatabase.child(dataUrl).set(data);
  }

  @override
  Stream<Event> getDataStream({required String dataUrl}) {
    return _firebaseDatabase.child(dataUrl).onValue;
  }

  @override
  Future<void> downloadFile(
      {required String fileUrl, required File out}) async {
    try {
      await _firebaseStorage.ref(fileUrl).writeToFile(out);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Future<void> updateData({required String dataUrl, required data}) async {
    _firebaseDatabase.child(dataUrl).update(data);
  }
}
