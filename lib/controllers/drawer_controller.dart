import 'package:fitness_application/database/drawer_items.dart' as items;
import 'package:fitness_application/models/drawer_item.dart';
import 'package:get/get.dart';

class DrawerController extends GetxController {
  bool _isDrawerOpen = false;
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1;

  // Get of drawers items
  List<DrawerItem> get drawerItems => items.drawerItems;

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
