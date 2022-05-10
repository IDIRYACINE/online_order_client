import 'package:flutter/widgets.dart';

class OptionalItem {
  final String _label;
  final IconData? _icon;

  OptionalItem(this._label, [this._icon]);

  String getLabel() {
    return _label;
  }

  IconData? getIconData() {
    return _icon;
  }
}
