import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Address {
  late String _address;
  late double _latitude, _longitude;

  Address([String? address, double? latitude, double? longitude]) {
    _address = address ?? "";
    _latitude = latitude ?? 0;
    _longitude = longitude ?? 0;
  }

  /// Request device location.handle GPS permission issues
  Future<bool> getDeviceLocation() async {
    Location location = Location();
    LocationData _locationData;
    _locationData = await location.getLocation();
    _latitude = _locationData.latitude!;
    _longitude = _locationData.longitude!;
    _address = "bloc C";
    return true;
  }

  /// Return address aditional infos
  /// Example : door number 10 , bloc A
  String getAddress() {
    return _address;
  }

  /// Return address location on map as GPS coordinates
  LatLng getCoordinates() {
    return LatLng(_latitude, _longitude);
  }

  /// Update address location on map
  void updateCoordinates(
      {required double latitude, required double longitude}) {
    _latitude = latitude;
    _longitude = longitude;
  }

  /// Update associated address infos
  void updateAddress({required String infos}) {
    _address = infos;
  }

  /// Encode address as a json
  Map<String, dynamic> toMap() {
    return {
      "latitude": _latitude,
      "longitude": _longitude,
      "address": _address
    };
  }
}
