import 'package:flutter/widgets.dart';
import 'package:online_order_client/Domain/Profile/profile_model.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:provider/provider.dart';

import '../Providers/navigation_provider.dart';

class ProfileHelper {
  final IAuthenticationService _authenticationService;
  final ProfileModel _profile;

  ProfileHelper(this._authenticationService, this._profile);

  void setDeliveryAddresse(BuildContext context) {
    Provider.of<NavigationProvider>(context, listen: false)
        .navigateToDeliveryAddressScreen(context);
  }

  void isLoggedIn(BuildContext context) {
    _authenticationService
        .accountIsActive()
        .then((value) => {
              if (value)
                {
                  Provider.of<NavigationProvider>(context, listen: false)
                      .navigateToProfile(context)
                }
              else
                {
                  Provider.of<NavigationProvider>(context, listen: false)
                      .navigateToLogin(context)
                }
            })
        .catchError((error) {
      Provider.of<NavigationProvider>(context, listen: false)
          .navigateToLogin(context);
    });
  }

  void updateProfile() {}

  void getAddressInstance() {}
}
