// ignore_for_file: constant_identifier_names

abstract class ICustomerDataSynchroniser {
  Future<void> updateUserPhone();
  Future<String> fetchUserPhone(String id);
  void setPhone(String phoneNumber);
  void setId(String id);
}

enum UserData { FullName, Id, Email, Phone }

enum RestApi { RegisterCustomer, UpdateCustomer, FetchCustomer }
