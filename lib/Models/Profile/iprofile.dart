import 'address_model.dart';

abstract class IProfile {
  String getFullName();
  String getEmail();
  String getPhoneNumber();
  String getPhoneImei();
  void setFullName({required String fullName});
  void setEmail({required String email});
  void setPhoneNumber({required String number});
  AddressModel getAddress();
  void setAddress({required AddressModel addressModel});
  String getProfileJson();
  Future<void> saveProfile();
  Future<void> loadProfile();
}
