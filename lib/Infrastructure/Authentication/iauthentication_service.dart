import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthenticationService {
  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName,
      required String phoneNumber});

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signOut();

  Future<void> requestNewPassword();

  Future<void> confirmNewPassword(
      {required String code, required String newPassword});

  Future<void> requestVerificationCode({required String email});

  Future<void> confirmVerificationCode(
      {required String code,
      required VoidCallback onSucess,
      required VoidCallback onFail});

  Future<void> requestPhoneVerification(
      {required String phone,
      required Function onVerificationCompleted,
      required Function onSmsCodeSent});

  Future<void> confirmPhoneVerification({required String smsCode});

  Future<void> linkAuthProviderWithProfile(
      {required AuthCredential authProvider});

  Future<bool> accountIsActive();

  Future<void> updateEmail({required String newEmail});

  Future<void> updatePassword({required String newPassword});

  String getEmail();
  String getUsername();
  String getId();
  String getPhoneNumber();

  Future<void> signInWithPhoneNumber();

  Future<void> updateFullName({required String fullName});

  Future<void> signInWithFacebook({required AuthCredential credential});

  Future<void> unlinkProvider({required String providerId});
  Future<bool> isLinkedWithProvider({required String providerId});
}
