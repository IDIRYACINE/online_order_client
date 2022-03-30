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
      helper.setUserId(_authService.getId());
      Navigator.pop(_context);
    }).catchError((e) {
      _handleSignInErrors(e.code);
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
      _handleSignUpErrors(e.code);
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
          _popUpMessage("Success", "Your phone has been validated");
        },
        onSmsCodeSent: () {
          //Make a pop up widget asking for the code
          //_authService.confirmPhoneVerification(smsCode: "913203");
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

  void _popUpMessage(String title, String message) {
    showDialog<String>(
        context: _context, builder: (context) => PopUpWidget(title, message));
  }

  void _setUpNewUserProfile(
      ProfileHelper helper, String fullName, String phone, String email) {
    helper.setProfile(fullName, phone, email);
    helper.registerProfile(_authService.getId());
  }

  void _handleSignInErrors(String code) {
    switch (code) {
      case InvalidLoginInfos.errorCode:
        {
          _popUpMessage("Invalid Login", "Incorrect password or email");
        }
        break;
      default:
        {
          _popUpMessage("Network Error", "You are offline");
        }
    }
  }

  void _handleSignUpErrors(String code) {
    switch (code) {
      case EmailAlreadyUsed.errorCode:
        {
          _popUpMessage("Invalid Email", "Email Already used");
        }
        break;
      default:
        {
          _popUpMessage("Network Error", "You are offline");
        }
    }
  }
}
