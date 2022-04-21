import "package:flutter/material.dart";
import 'package:online_order_client/Application/Providers/helpers_provider.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Infrastructure/Authentication/AuthenticationProviders/facebook_authentication.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/Exceptions/auth_exceptions.dart';
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
      helper.updateProfile(_authService.getId(), email);
      Navigator.pop(_context);
    }).catchError((e) {
      _handleErrors(e.code);
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
    }).catchError((e) {
      _handleErrors(e.code);
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
        onVerificationCompleted: () {
          sendCodeAlert(_context, "Your phone has been validated");
        },
        onSmsCodeSent: () {
          //Make a pop up widget asking for the code
          //_authService.confirmPhoneVerification(smsCode: "913203");
        });
  }

  void sendPasswordResetCode() {
    _authService.requestNewPassword();
  }

  void updatePassword(String password) {
    _authService.confirmNewPassword(code: "code", newPassword: password);
  }

  void updateEmail(String newEmail) {
    _authService.updateEmail(newEmail: newEmail);
  }

  void logout() {
    _authService.signOut();
  }

  void _setUpNewUserProfile(
      ProfileHelper helper, String fullName, String phone, String email) {
    helper.setProfile(fullName, phone, email);
    helper.registerProfile(_authService.getId());
  }

  void _handleErrors(String code) {
    switch (code) {
      case InvalidLoginInfos.errorCode:
        {
          sendCodeAlert(_context, "Incorrect password or email");
        }
        break;
      case EmailAlreadyUsed.errorCode:
        {
          sendCodeAlert(_context, "Email Already used");
        }
        break;
      default:
        {
          sendCodeAlert(_context, "You are offline");
        }
    }
  }
}
