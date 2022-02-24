import 'package:flutter/widgets.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:provider/provider.dart';

import '../Providers/navigation_provider.dart';

class ProfileHelper {
  final IAuthenticationService _authenticationService;

  ProfileHelper(this._authenticationService);

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
}
