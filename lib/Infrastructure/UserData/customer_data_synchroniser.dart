// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:online_order_client/Infrastructure/UserData/icustomer_data_synchroniser.dart';
import 'package:http/http.dart' as http;

class CustomerDataSynchroniser implements ICustomerDataSynchroniser {
  final String _host;
  final Map<String, Object> infos = {};

  CustomerDataSynchroniser(this._host);

  @override
  void setPhone(String phoneNumber) {
    infos['PhoneNumber'] = phoneNumber;
  }

  @override
  void setId(String id) {
    infos['Id'] = id;
  }

  @override
  Future<void> updateUserPhone() async {
    Uri url = Uri.parse('$_host/UpdateCustomerPhone');
    String json = jsonEncode(infos);
    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: json);
  }

  @override
  Future<String> fetchUserPhone(String id) async {
    Uri url = Uri.parse('$_host/FetchCustomerPhone?customerId=$id');
    String result = "";
    try {
      http.get(url).then((value) {
        final data = jsonDecode(value.body);
        result = (data["PhoneNumber"]! as String);
      });
    } catch (e) {
      result = "";
    }
    return result;
  }
}
