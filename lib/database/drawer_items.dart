import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/models/drawer_item.dart';

List<DrawerItem> drawerItems = [
  DrawerItem(
    element: DrawerElement.home,
    iconData: EvaIcons.homeOutline,
  ),
  DrawerItem(
    element: DrawerElement.profile,
    iconData: EvaIcons.personOutline,
  ),
  DrawerItem(
    element: DrawerElement.favorite,
    iconData: EvaIcons.heartOutline,
  ),
  DrawerItem(
    element: DrawerElement.analytic,
    iconData: EvaIcons.activityOutline,
  ),
  DrawerItem(
    element: DrawerElement.setting,
    iconData: EvaIcons.settingsOutline,
  ),
  DrawerItem(
    element: DrawerElement.onboarding,
    iconData: EvaIcons.radioButtonOffOutline,
  ),
];
