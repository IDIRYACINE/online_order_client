import '../GpsLocation/address.dart';

abstract class IProfile {
  String getFullName();
  String getEmail();
  String getPhoneNumber();
  String getUserId();
  void setUserId({required String id});
  void setFullName({required String fullName});
  void setEmail({required String email});
  void setPhoneNumber({required String number});
  Address getAddress();
  void setAddress({required Address address});
  String getProfileJson();
  Future<void> saveProfile();
  Future<void> loadProfile();
  Map<String, dynamic> toMap();
}