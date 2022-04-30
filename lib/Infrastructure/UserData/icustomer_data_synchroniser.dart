// ignore_for_file: constant_identifier_names

import 'package:online_order_client/Domain/Profile/profile_model.dart';

abstract class ICustomerDataSynchroniser {
  Future<void> updateUserPhone();
  Future<void> fetchUserPhone(ProfileModel profile);
  void setPhone(String phoneNumber);
  void setId(String id);
}

enum UserData { FullName, Id, Email, Phone }

enum RestApi { RegisterCustomer, UpdateCustomer, FetchCustomer }
