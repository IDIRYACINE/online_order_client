import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_order_client/Domain/GpsLocation/address.dart';
import 'package:online_order_client/Infrastructure/UserData/icustomer_data_synchroniser.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

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
    Uri url = Uri.parse('$_host/${RestApi.RegisterCustomer}');
    http.Response response = await http.post(url,
        body: {'infos': infos.toString(), 'extras': extras.toString()});
    developer.log(response.body, name: "IDIR.IDIR");
  }

  ///not implemented on server
  @override
  Future<void> updateUser() async {
    Uri url = Uri.parse('$_host/${RestApi.UpdateCustomer}');

    http.Response response =
        await http.post(url, body: {infos: infos, extras: extras});
    developer.log(response.body, name: "IDIR.IDIR");
  }
}
