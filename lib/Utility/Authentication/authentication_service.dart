import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_order_client/Models/GpsLocation/address.dart';
import 'package:online_order_client/Models/Profile/iprofile.dart';
import 'package:online_order_client/Models/Profile/profile_model.dart';
import 'package:online_order_client/Utility/Authentication/authentification_exceptions.dart';
import 'package:online_order_client/Utility/Authentication/iauthentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService implements IAuthenticationService {
  static final FirebaseAuthenticationService _instance =
      FirebaseAuthenticationService._();

  factory FirebaseAuthenticationService() {
    return _instance;
  }

  FirebaseAuthenticationService._();

  late FirebaseAuth _auth;
  late User _user;
  late FirebaseFirestore _firestore;
  late String _smsCodeId;
  int? _forceSmsResendToken;

  void initialize(FirebaseAuth auth, FirebaseFirestore firestore) {
    _auth = auth;
    _firestore = firestore;
  }

  @override
  Future<bool> accountIsActive() async {
    if (_user.emailVerified && _user.phoneNumber != null) {
      return true;
    }
    return false;
  }

  @override
  Future<void> confirmNewPassword(
      {required String code, required String newPassword}) async {
    _auth.confirmPasswordReset(code: code, newPassword: newPassword);
  }

  @override
  Future<void> confirmPhoneVerification({required String smsCode}) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _smsCodeId, smsCode: smsCode);
    linkAuthProviderWithProfile(authProvider: phoneAuthCredential);
  }

  @override
  Future<void> linkAuthProviderWithProfile({required authProvider}) async {
    try {
      _user.linkWithCredential(authProvider);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> reAuthentificate(
      {required String password, required String email}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> requestEmailVerification({required String email}) async {
    try {
      _user.sendEmailVerification();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> requestNewPassword({required String email}) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> requestPhoneVerification(
      {required String phone,
      required Function onVerificationCompleted,
      required Function onSmsCodeSent}) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (phoneAuthCredential) {
            linkAuthProviderWithProfile(authProvider: phoneAuthCredential);
            _user.reload;
            onVerificationCompleted();
          },
          verificationFailed: (exception) {},
          codeSent: (codeId, forceTokenResendId) {
            _smsCodeId = codeId;
            _forceSmsResendToken = forceTokenResendId;
            onSmsCodeSent();
          },
          codeAutoRetrievalTimeout: (exception) {});
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _user = _auth.currentUser!;
    } on FirebaseAuthException catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> signOut() async {
    _auth.signOut();
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user = _auth.currentUser!;
    } on FirebaseAuthException catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> updateDeliveryAddress({required Address newAddress}) async {
    try {
      DocumentReference addressDoc = _firestore
          .collection("users")
          .doc(_user.uid)
          .collection("extras")
          .doc("deliveryAddress");
      addressDoc.update(newAddress.toMap());
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> updateEmail({required String newEmail}) async {
    try {
      _user.verifyBeforeUpdateEmail(newEmail);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> updatePassword({required String newPassword}) async {
    try {
      _user.updatePassword(newPassword);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> updateUserName({required String newUserName}) async {
    try {
      DocumentReference userDoc = _firestore.collection("users").doc(_user.uid);
      userDoc.update({"userName": newUserName});
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
