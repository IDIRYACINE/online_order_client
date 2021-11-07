import '../GpsLocation/address.dart';

abstract class IProfile {
  String getFullName();
  String getEmail();
  String getPhoneNumber();
  String getPhoneImei();
  void setFullName({required String fullName});
  void setEmail({required String email});
  void setPhoneNumber({required String number});
  Address getAddress();
  void setAddress({required Address address});
  String getProfileJson();
  Future<void> saveProfile();
  Future<void> loadProfile();
}
