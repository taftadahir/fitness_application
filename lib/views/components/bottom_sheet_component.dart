// import 'dart:js';

import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetComponent {
  static void bottomSheet(
    BuildContext context, {
    required List<Widget> widgets,
  }) {
    Get.bottomSheet(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 8 * LayoutConstant.scaleFactor,
              bottom: 24 * LayoutConstant.scaleFactor,
            ),
            height: 2 * LayoutConstant.scaleFactor,
            width: 48 * LayoutConstant.scaleFactor,
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius:
                  BorderRadius.circular(4 * LayoutConstant.scaleFactor),
            ),
          ),
          ...widgets,
          SizedBox(
            height: 32 * LayoutConstant.scaleFactor,
          )
        ],
      ),
      isDismissible: true,
      isScrollControlled: true,
      shape: context.theme.bottomSheetTheme.shape,
      backgroundColor: context.theme.bottomSheetTheme.backgroundColor,
    );
  }
}


// Widgets

// Filter
// SizedBox(
//   width: Get.width - 2 * LayoutConstant.screenPadding,
//   child: Text(
//     "Filter",
//     textAlign: TextAlign.start,
//     style: context.theme.textTheme.titleLarge,
//   ),
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     TextButton(
//       onPressed: () {},
//       child: Text(
//         'All',
//         style: context.theme.textTheme.headlineMedium,
//       ),
//     ),
//     SizedBox(
//       width: 16 * LayoutConstant.scaleFactor,
//     ),
//     IconButton(
//       onPressed: () {},
//       icon: const Icon(EvaIcons.heartOutline),
//     ),
//     SizedBox(
//       width: 16 * LayoutConstant.scaleFactor,
//     ),
//     IconButton(
//       onPressed: () {},
//       icon: const Icon(EvaIcons.heart),
//     ),
//   ],
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// ButtonComponent(onPressed: () {}, text: 'Apply'),

// Units
// SizedBox(
//   width: Get.width - 2 * LayoutConstant.screenPadding,
//   child: Text(
//     "Units",
//     textAlign: TextAlign.start,
//     style: context.theme.textTheme.titleLarge,
//   ),
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Radio(
//       value: 1,
//       groupValue: 1,
//       onChanged: (value) {},
//     ),
//     Text(
//       'kg/m',
//       style: context.theme.textTheme.headlineMedium,
//     ),
//     SizedBox(
//       width: 16 * LayoutConstant.scaleFactor,
//     ),
//     Radio(
//       value: 2,
//       groupValue: 1,
//       onChanged: (value) {},
//     ),
//     Text(
//       'lbs/ft',
//       style: context.theme.textTheme.headlineMedium,
//     ),
//   ],
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// ButtonComponent(onPressed: () {}, text: 'Done'),

// Languages
// SizedBox(
//   width: Get.width - 2 * LayoutConstant.screenPadding,
//   child: Text(
//     "Languages",
//     textAlign: TextAlign.start,
//     style: context.theme.textTheme.titleLarge,
//   ),
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Radio(
//       value: 1,
//       groupValue: 1,
//       onChanged: (value) {},
//     ),
//     Text(
//       'French',
//       style: context.theme.textTheme.headlineMedium,
//     ),
//     SizedBox(
//       width: 16 * LayoutConstant.scaleFactor,
//     ),
//     Radio(
//       value: 2,
//       groupValue: 1,
//       onChanged: (value) {},
//     ),
//     Text(
//       'English',
//       style: context.theme.textTheme.headlineMedium,
//     ),
//   ],
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// ButtonComponent(onPressed: () {}, text: 'Done'),

// Count down
// SizedBox(
//   width: Get.width - 2 * LayoutConstant.screenPadding,
//   child: Text(
//     "Count down",
//     textAlign: TextAlign.start,
//     style: context.theme.textTheme.titleLarge,
//   ),
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// Text(
//   "Seconds",
//   textAlign: TextAlign.start,
//   style: context.theme.textTheme.bodyLarge,
// ),
// NumberPicker(
//   minValue: 0,
//   maxValue: 100,
//   value: 50,
//   axis: Axis.horizontal,
//   selectedTextStyle:
//       context.theme.textTheme.labelLarge?.copyWith(
//     color: AppColor.darkPrimary,
//   ),
//   textStyle: context.theme.textTheme.headlineLarge,
//   itemCount: 5,
//   itemWidth: (Get.width - 4 * LayoutConstant.screenPadding) / 5,
//   onChanged: (value) {},
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// ButtonComponent(onPressed: () {}, text: 'Done'),

// Many reps
// SizedBox(
//   width: Get.width - 2 * LayoutConstant.screenPadding,
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: [
//       Text(
//         "How many",
//         textAlign: TextAlign.start,
//         style: context.theme.textTheme.titleLarge,
//       ),
//       SizedBox(
//         height: 8 * LayoutConstant.scaleFactor,
//       ),
//       Text(
//         "Repetition did you do ?",
//         textAlign: TextAlign.start,
//         style: context.theme.textTheme.bodyLarge,
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// NumberPicker(
//   minValue: 0,
//   maxValue: 100,
//   value: 50,
//   axis: Axis.horizontal,
//   selectedTextStyle:
//       context.theme.textTheme.labelLarge?.copyWith(
//     color: AppColor.darkPrimary,
//   ),
//   textStyle: context.theme.textTheme.headlineLarge,
//   itemCount: 5,
//   itemWidth: (Get.width - 4 * LayoutConstant.screenPadding) / 5,
//   onChanged: (value) {},
// ),
// SizedBox(
//   height: 32 * LayoutConstant.scaleFactor,
// ),
// ButtonComponent(onPressed: () {}, text: 'Done'),