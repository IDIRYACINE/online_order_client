// ignore_for_file: constant_identifier_names
typedef OnResult = void Function(String value);

abstract class ICustomerDataSynchroniser {
  Future<void> updateUserPhone();
  Future<void> fetchUserPhone(String id, OnResult onResult);
  void setPhone(String phoneNumber);
  void setId(String id);
}

enum UserData { FullName, Id, Email, Phone }

enum RestApi { RegisterCustomer, UpdateCustomer, FetchCustomer }
