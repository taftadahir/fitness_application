import 'package:get/get.dart';

class LayoutConstant {
  // TODO: Layout constant
  static const double _screenMinWidth = 320.0;
  static const double cardElevation = 0;
  static double cardRadius = 8 * scaleFactor;
  static double scaleFactor = Get.width / _screenMinWidth;
  static double screenPadding = 16 * scaleFactor;
  static double programCardHeight = 96 * scaleFactor;
  static double spaceBetweenTitleAndElements = 16 * scaleFactor;
  static double spaceBetweenElements = 16 * scaleFactor;
}
