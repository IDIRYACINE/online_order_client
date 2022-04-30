import "package:flutter/material.dart";
import 'package:online_order_client/Application/Authentication/authentication_error_handler.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Infrastructure/Authentication/AuthenticationProviders/facebook_authentication.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/UserData/icustomer_data_synchroniser.dart';
import 'package:online_order_client/Ui/Components/popup_widget.dart';
import 'package:provider/provider.dart';

class AuthenticationHelper {
  late final IAuthenticationService _authService;
  late final FacebookAuthentication _fbAuthentication;
  late final ProfileModel _profile;
  late final AuthenticationErrorHandler _errorHandler;
  late final ICustomerDataSynchroniser _dataSynchroniser;
  late BuildContext _context;

  AuthenticationHelper(this._profile, this._authService, this._fbAuthentication,
      this._errorHandler, this._dataSynchroniser);

  void setBuildContext(BuildContext context) {
    _context = context;
    _errorHandler.setBuildContext(context);
  }

  void signInWithEmailAndPassword(String email, String password) {
    _authService
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      _reloadProfile();
      Navigator.pop(_context);
    }).catchError((e) {
      _errorHandler.handleErrors(e.code);
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
        Provider.of<NavigationProvider>(_context, listen: false)
            .navigateToDeliveryAddressScreen(
                _context, () => {_updateProfile(fullName, phone, email)},
                replace: true);
      });
    }).catchError((e) {
      _errorHandler.handleErrors(e.code);
    });
  }

  void _reloadProfile() {
    _dataSynchroniser.setId(_authService.getId());
    _dataSynchroniser.fetchUserPhone(_profile).then((value) {
      _profile.setEmail(email: _authService.getEmail());
      _profile.setFullName(fullName: _authService.getUsername());
      _profile.saveProfile();
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
    _authService
        .updateEmail(newEmail: newEmail)
        .then((value) => {_profile.setEmail(email: newEmail)});
  }

  void logout() {
    _authService.signOut();
  }

  void updatePhoneNumber(String newPhone) {
    _dataSynchroniser.setPhone(newPhone);
    _dataSynchroniser.updateUserPhone().then((value) {
      _profile.setPhoneNumber(number: newPhone);
      _profile.saveProfile();
    });
  }

  void _updateProfile(String fullName, String phone, String email) {
    _profile.setEmail(email: email);
    _profile.setFullName(fullName: fullName);
    _profile.setPhoneNumber(number: phone);
    _profile.saveProfile();
  }

  void setDeliveryAddresse(BuildContext context) {
    Provider.of<NavigationProvider>(context, listen: false)
        .navigateToDeliveryAddressScreen(context, () => {}, replace: false);
  }

  void isLoggedIn(BuildContext context) {
    _authService.accountIsActive().then((value) {
      if (value) {
        Provider.of<NavigationProvider>(context, listen: false)
            .navigateToProfile(context);
      } else {
        Provider.of<NavigationProvider>(context, listen: false)
            .navigateToLogin(context);
      }
    }).catchError((error) {
      Provider.of<NavigationProvider>(context, listen: false)
          .navigateToLogin(context);
    });
  }

  ProfileModel getProfile() {
    return _profile;
  }
}
