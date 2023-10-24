import "package:flutter/material.dart";
import 'package:online_order_client/Application/Authentication/authentication_error_handler.dart';
import 'package:online_order_client/Application/Providers/navigation_provider.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Infrastructure/Authentication/AuthenticationProviders/facebook_authentication.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/UserData/icustomer_data_synchroniser.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';
import 'package:online_order_client/Ui/Components/dialogs.dart';
import 'package:online_order_client/Ui/Themes/constants.dart';
import 'package:provider/provider.dart';

enum userData { fullName, phoneNumber, address, password, email }

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
      ServicesProvider()
          .orderService
          .listenToOrderStatusOnServer(_authService.getId());
      Navigator.pop(_context);
    }).catchError((e) {
      _errorHandler.handleErrors(e.code);
    });
  }

  void signUpWithEmailAndPassword(
      String fullName, String email, String password, String phone) {
    _authService
        .signUpWithEmailAndPassword(
            email: email,
            password: password,
            fullName: fullName,
            phoneNumber: phone)
        .then((value) {
      _dataSynchroniser.setId(_authService.getId());
      _dataSynchroniser.setPhone(phone);
      _dataSynchroniser.updateUserPhone();
      _authService
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Provider.of<NavigationProvider>(_context, listen: false)
            .navigateToDeliveryAddressScreen(
                _context, () => _updateProfile(fullName, phone, email),
                replace: true);
      });
    }).catchError((e) {
      _errorHandler.handleErrors(e.code);
    });
  }

  void _reloadProfile() {
    _profile.setEmail(email: _authService.getEmail());
    _profile.setFullName(fullName: _authService.getUsername());
    _dataSynchroniser.fetchUserPhone(_authService.getId(), (value) {
      _profile.setPhoneNumber(number: value);
      _profile.saveProfile();
    });
  }

  void sendPasswordResetCode() {
    GlobalKey<FormState> formKey = GlobalKey();

    showDialog<AlertDialog>(
        context: _context,
        builder: (context) {
          return TextFieldAlertDialog(
            label: emailLabel,
            formKey: formKey,
            onConfirm: (String value) {
              _authService.requestNewPassword().then((value) {
                Navigator.of(context).pop();
                showDialog<AlertDialog>(
                    context: _context,
                    builder: (context) {
                      return const ErrorAlertDialog(labelNewPassword);
                    });
              });
            },
          );
        });
  }

  void updatePassword(String password) {
    _authService.confirmNewPassword(code: "code", newPassword: password);
  }

  void updateEmail(String newEmail) {
    _authService
        .updateEmail(newEmail: newEmail)
        .then((value) => {_profile.setEmail(email: newEmail)});
  }

  void updateFullName(String fullName) {
    _authService
        .updateFullName(fullName: fullName)
        .then((value) => {_profile.setFullName(fullName: fullName)});
  }

  void logout() {
    _authService.signOut();
    ServicesProvider().orderService.cancelAllSubscribtions();
  }

  void updatePhoneNumber(String newPhone) {
    _dataSynchroniser.setId(_authService.getId());
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

  void isLoggedIn(BuildContext context) {
    _authService.accountIsActive().then((value) {
      if (value) {
        Provider.of<NavigationProvider>(context, listen: false)
            .navigateToProfile(context, () {
          logout();
          Navigator.pop(context);
        });
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

  String getAddress() {
    return _profile.getAddress().getAddress();
  }

  void setDeliveryAddresse(BuildContext context) {
    Provider.of<NavigationProvider>(context, listen: false)
        .navigateToDeliveryAddressScreen(
            context, () => Navigator.pop(context),
            replace: false);
  }

  String getFullName() {
    return _profile.getFullName();
  }

  String getEmail() {
    return _profile.getEmail();
  }

  String getPhone() {
    return _profile.getPhoneNumber();
  }

  void saveProfile() {
    _profile.saveProfile();
  }

  void signInWithFacebook() {
    _fbAuthentication.singIn().then((profileFb) {
      ServicesProvider()
          .orderService
          .listenToOrderStatusOnServer(_authService.getId());
      Navigator.pop(_context);
    });
  }

  void unlinkFacbookAccount() {
    _fbAuthentication.unlinkFacebook();
  }

  void linkFacbookAccount() {
    _fbAuthentication.linkFacebook();
  }
}
