import 'package:flutter/material.dart';
import 'package:online_order_client/Infrastructure/Authentication/AuthenticationProviders/facebook_authentication.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';

class AuthenticationHelper {
  late final IAuthenticationService _authService;
  late final FacebookAuthentication _fbAuthentication;
  late BuildContext _context;

  AuthenticationHelper(this._authService, this._fbAuthentication);

  void setBuildContext(BuildContext context) {
    _context = context;
  }

  void signInWithEmailAndPassword(String email, String password) {
    _authService
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pop(_context);
    }).catchError((error) {
      _popUpErrorBox(error);
    });
  }

  void signUpWithEmailAndPassword(String email, String password) {
    _authService
        .signUpWithEmailAndPassword(email: email, password: password)
        .then((value) => {_popUpRegsiteredBox()})
        .catchError((error) {
      _popUpErrorBox(error);
    });
  }

  void signUpWithFacebook() {
    _fbAuthentication.signUp();
  }

  void signInWithFacebook() {
    _fbAuthentication.singIn();
  }

  void requestPhoneValidation(String phone) {
    _authService.requestPhoneVerification(
        phone: phone,
        onVerificationCompleted: () {},
        onSmsCodeSent: () {
          _authService.confirmPhoneVerification(smsCode: "913203");
        });
  }

  void resetPassword(String email) {
    _authService.requestNewPassword(email: email);
  }

  void sendConfirmationEmail(String email) {
    _authService.requestEmailVerification(email: email);
  }

  void signOut() {
    _authService.signOut();
  }

  void _popUpRegsiteredBox() {
    showDialog<String>(
        context: _context,
        builder: (context) =>
            const PopUpWidget("Registered", "Confirmation Email Sent"));
  }

  void _popUpErrorBox(Error error) {
    showDialog<String>(
        context: _context,
        builder: (context) =>
            const PopUpWidget("Error", "Replact with actual error message"));
  }
}
