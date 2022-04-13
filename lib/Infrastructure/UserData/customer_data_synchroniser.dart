// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_order_client/Domain/GpsLocation/address.dart';
import 'package:online_order_client/Infrastructure/UserData/icustomer_data_synchroniser.dart';
import 'package:http/http.dart' as http;

class CustomerDataSynchroniser implements ICustomerDataSynchroniser {
  final String _host;
  final Map<String, Object> infos = {};
  final Map<String, Object> extras = {};

  CustomerDataSynchroniser(this._host);

  @override
  void setAddress(Address address) {
    extras['Address'] = address.getAddress();
    LatLng coordinates = address.getCoordinates();
    extras['Latitude'] = coordinates.latitude;
    extras['Longitude'] = coordinates.longitude;
  }

  @override
  void setEmail(String email) {
    infos['Email'] = email;
  }

  @override
  void setFullName(String fullName) {
    infos['FullName'] = fullName;
  }

  @override
  void setPhone(String phoneNumber) {
    infos['PhoneNumber'] = phoneNumber;
  }

  @override
  void setId(String id) {
    infos['Id'] = id;
    extras['Id'] = id;
  }

  @override
  Future<void> registerUser() async {
    Uri url = Uri.parse('$_host/RegisterCustomer');
    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonEncode({'infos': infos, 'extras': extras}).toString());
  }

  ///not implemented on server
  @override
  Future<void> updateUser() async {
    Uri url = Uri.parse('$_host/UpdateCustomer');

    http.Response response =
        await http.post(url, body: {infos: infos, extras: extras});
  }
}
