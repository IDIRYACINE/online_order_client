import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:online_order_client/Models/GpsLocation/address.dart';

class DeliveryAddress {
  final Address _address = Address();

  Future<bool> initGpsLocation() async {
    await _requestLocationPermission();
    await _address.getDeviceLocation();
    return true;
  }

  LatLng getLocation() {
    return _address.getLocation();
  }

  void setLocation({required LatLng coordinations, required String infos}) {
    _address.updateInfos(infos: infos);
    _address.updateLocation(
        latitude: coordinations.latitude, longitude: coordinations.longitude);
  }

  Future<void> _requestLocationPermission() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        throw Error();
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Error();
      }
    }
  }
}
