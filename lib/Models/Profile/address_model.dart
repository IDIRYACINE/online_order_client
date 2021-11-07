import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:online_order_client/Utility/permissions_service.dart';

class Address {
  late String _extras;
  late double _latitude, _longitude;

  Address();

  /// Request device location.handle GPS permission issues
  Future<bool> getDeviceLocation() async {
    PermissionService.requestLocationPermission();
    Location location = Location();
    LocationData _locationData;
    _locationData = await location.getLocation();
    _latitude = _locationData.latitude!;
    _longitude = _locationData.longitude!;
    _extras = "bloc C";
    return true;
  }

  /// Return address aditional infos
  /// Example : door number 10 , bloc A
  String getInfos() {
    return _extras;
  }

  /// Return address location on map as GPS coordinates
  LatLng getLocation() {
    return LatLng(_latitude, _longitude);
  }

  /// Update address location on map
  void updateLocation({required double latitude, required double longitude}) {
    _latitude = latitude;
    _longitude = longitude;
  }

  /// Update associated address infos
  void updateInfos({required String infos}) {
    _extras = infos;
  }

  /// Encode address as a json
  Map<String, dynamic> toMap() {
    return {"latitude": _latitude, "longitude": _longitude, "extras": _extras};
  }
}
