import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/models/drawer_item.dart';
import 'package:get/get.dart';

class DrawerController extends GetxController {
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
  bool _isDrawerOpen = false;
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1;

  // isDrawerOpen
  bool get isDrawerOpen => _isDrawerOpen;
  set isDrawerOpen(bool isDrawerOpen) {
    _isDrawerOpen = isDrawerOpen;
    update();
  }

  // xOffset
  double get xOffset => _xOffset;
  set xOffset(double xOffset) {
    _xOffset = xOffset;
    update();
  }

  // yOffset
  double get yOffset => _yOffset;
  set yOffset(double yOffset) {
    _yOffset = yOffset;
    update();
  }

  // scaleFactor
  double get scaleFactor => _scaleFactor;
  set scaleFactor(double scaleFactor) {
    _scaleFactor = scaleFactor;
    update();
  }

  // openDrawer
  void openDrawer() {
    _xOffset = Get.width * 0.8;
    _yOffset = Get.height * 0.1;
    _scaleFactor = 0.8;
    _isDrawerOpen = true;
    update();
  }

  // closeDrawer
  void closeDrawer() {
    _xOffset = 0;
    _yOffset = 0;
    _scaleFactor = 1;
    _isDrawerOpen = false;
    update();
  }
}
