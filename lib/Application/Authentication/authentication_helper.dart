import "package:flutter/material.dart";
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Infrastructure/Authentication/AuthenticationProviders/facebook_authentication.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';
import 'package:provider/provider.dart';
import '../Profile/profile_helper.dart';

class AuthenticationHelper {
  late final IAuthenticationService _authService;
  late final FacebookAuthentication _fbAuthentication;
  late BuildContext _context;

  AuthenticationHelper(this._authService, this._fbAuthentication);

  void setBuildContext(BuildContext context) {
    _context = context;
  }

  void signInWithEmailAndPassword(
      ProfileHelper helper, String email, String password) {
    _authService
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      helper.setUserId(_authService.getId());
      Navigator.pop(_context);
    }).catchError((error) {
      _popUpErrorBox(error);
    });
  }

  void signUpWithEmailAndPassword(
      String fullName, String email, String password, String phone) {
    _authService
        .signUpWithEmailAndPassword(email: email, password: password)
        .then((value) {
      _authService
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ProfileHelper profileHelper =
            Provider.of<HelpersProvider>(_context, listen: false).profileHelper;
        Provider.of<NavigationProvider>(_context, listen: false)
            .navigateToDeliveryAddressScreen(
                _context,
                () => {
                      _setUpNewUserProfile(
                          profileHelper, fullName, phone, email)
                    },
                replace: true);
      });
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

  void _setUpNewUserProfile(
      ProfileHelper helper, String fullName, String phone, String email) {
    helper.setProfile(fullName, phone, email);
    helper.registerProfile(_authService.getId());
  }
}
