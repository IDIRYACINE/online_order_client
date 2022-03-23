import 'package:flutter/widgets.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/UserData/icustomer_data_synchroniser.dart';
import 'package:provider/provider.dart';

import '../Providers/navigation_provider.dart';

class ProfileHelper {
  final IAuthenticationService _authenticationService;
  final ProfileModel _profile;
  final ICustomerDataSynchroniser _dataSynchroniser;

  ProfileHelper(
      this._authenticationService, this._profile, this._dataSynchroniser);

  void setDeliveryAddresse(BuildContext context) {
    Provider.of<NavigationProvider>(context, listen: false)
        .navigateToDeliveryAddressScreen(context, () => {}, replace: false);
  }

  void isLoggedIn(BuildContext context) {
    _authenticationService.accountIsActive().then((value) {
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

  void setProfile(String fullName, String phone, String email) {
    _profile.setEmail(email: email);
    _profile.setFullName(fullName: fullName);
    _profile.setPhoneNumber(number: phone);
    _dataSynchroniser.setEmail(email);
    _dataSynchroniser.setFullName(fullName);
    _dataSynchroniser.setPhone(phone);
  }

  void updateProfile() {
    //TODO: not implemented
  }

  void registerProfile(String id) {
    _dataSynchroniser.setId(id);
    _dataSynchroniser.registerUser();
  }
}
