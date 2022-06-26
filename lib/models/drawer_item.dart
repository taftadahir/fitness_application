import 'package:flutter/cupertino.dart';

class DrawerItem {
  final DrawerElement element;
  final IconData iconData;

  DrawerItem({
    required this.element,
    required this.iconData,
  });
}

enum DrawerElement {
  home,
  profile,
  favorite,
  analytic,
  setting,
  onboarding,
}

extension DrawerElementExtension on DrawerElement {
  String get name {
    switch (this) {
      case DrawerElement.home:
        return 'Home';
      case DrawerElement.profile:
        return 'Profile';
      case DrawerElement.favorite:
        return 'Favorite';
      case DrawerElement.analytic:
        return 'Analytic';
      case DrawerElement.setting:
        return 'Setting';
      default:
        return 'On-boarding';
    }
  }
}
