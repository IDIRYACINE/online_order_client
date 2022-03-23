// ignore_for_file: constant_identifier_names

import 'package:online_order_client/Domain/GpsLocation/address.dart';

abstract class ICustomerDataSynchroniser {
  Future<void> registerUser();
  Future<void> updateUser();
  void setFullName(String fullName);
  void setPhone(String phoneNumber);
  void setEmail(String email);
  void setAddress(Address address);
  void setId(String id);
}

enum UserData { FullName, Id, Email, Phone }

enum RestApi { RegisterCustomer, UpdateCustomer }
