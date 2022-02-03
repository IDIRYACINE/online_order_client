import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Providers/navigation_provider.dart';

class SettingsHelper {
  late final BuildContext _context;
  void setBuildContext(BuildContext context) {
    _context = context;
  }

  void setDeliveryAddresse() {
    Provider.of<NavigationProvider>(_context)
        .navigateToDeliveryAddressScreen(_context);
  }

  void updateProfile() {}
}
