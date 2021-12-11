import 'package:online_order_client/Domain/GpsLocation/address.dart';

abstract class IAuthenticationService {
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Future<void> requestNewPassword({required String email});
  Future<void> confirmNewPassword(
      {required String code, required String newPassword});
  Future<void> requestEmailVerification({required String email});
  Future<void> requestPhoneVerification(
      {required String phone,
      required Function onVerificationCompleted,
      required Function onSmsCodeSent});
  Future<void> confirmPhoneVerification({required String smsCode});
  Future<void> linkAuthProviderWithProfile({required dynamic authProvider});
  Future<bool> accountIsActive();
  Future<void> updateEmail({required String newEmail});
  Future<void> updatePassword({required String newPassword});
  Future<void> updateDeliveryAddress({required Address newAddress});
  Future<void> updateUserName({required String newUserName});
  Future<void> reAuthentificate(
      {required String password, required String email});
}
