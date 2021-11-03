import 'dart:convert';

class AddressModel {
  late String _coordinationX, _coordinationY, _extraInfos;

  AddressModel(
      {required String coordinationX,
      required String coordinationY,
      required String extraInfos}) {
    _coordinationX = coordinationX;
    _coordinationY = coordinationY;
    _extraInfos = extraInfos;
  }

  String getCoordinationX() {
    return _coordinationX;
  }

  String getCoordinationY() {
    return _coordinationY;
  }

  String getExtraInfos() {
    return _extraInfos;
  }

  void setCoordinations(
      {required String coordinationX, required String coordinationY}) {
    _coordinationX = coordinationX;
    _coordinationY = coordinationY;
  }

  void setExtraInfos({required String extraInfos}) {
    _extraInfos = extraInfos;
  }
}
