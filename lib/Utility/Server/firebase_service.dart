import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:online_order_client/Utility/Server/ionline_data_service.dart';

class FireBaseServices implements IOnlineServerAcess {
  static final FireBaseServices _fireBaseServices = FireBaseServices._();

  late DatabaseReference _firebaseDatabase;
  late FirebaseStorage _firebaseStorage;

  factory FireBaseServices() {
    return _fireBaseServices;
  }
  /*https://online-order-client-default-rtdb.europe-west1.firebasedatabase.app
     
    _firebaseDatabase =
        FirebaseDatabase(app: Firebase.app(), databaseURL: url).reference();*/
  FireBaseServices._();

  void initialize(
      FirebaseStorage firebaseStorage, DatabaseReference rootDatabase) {
    _firebaseDatabase = rootDatabase;
    _firebaseStorage = firebaseStorage;
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
