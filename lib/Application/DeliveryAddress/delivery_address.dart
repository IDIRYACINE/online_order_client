import 'package:flutter/foundation.dart';
import 'package:online_order_client/Application/DeliveryAddress/latlng.dart';
import 'package:online_order_client/Domain/GpsLocation/address.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

class DeliveryAddress {
  final Address _address;

  DeliveryAddress(this._address);

  Future<bool> initGpsLocation() async {
    await ServicesProvider().permissionsService.requestGpsPermission();
    await _address.getDeviceLocation();
    return true;
  }

  LatLng getLocation() {
    return _address.getCoordinates();
  }

  void setLocation(
      {required double latitude,
      required double longitude,
      required String infos}) {
    _address.updateAddress(infos: infos);
    _address.updateCoordinates(latitude: latitude, longitude: longitude);
  }
}
