import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  void setLocation({required LatLng coordinations, required String infos}) {
    _address.updateAddress(infos: infos);
    _address.updateCoordinates(
        latitude: coordinations.latitude, longitude: coordinations.longitude);
  }
}
