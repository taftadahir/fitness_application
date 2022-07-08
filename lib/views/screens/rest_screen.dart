import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/timer_controller.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/button_component.dart';
import 'package:fitness_application/views/components/timer_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestScreen extends StatelessWidget {
  const RestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.close),
          onPressed: () {
            // TODO: Should show a popup in order to close the screen

            // Will be removed
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: AppTheme.scrollPhysic,
        child: Container(
          constraints: BoxConstraints(
            minHeight: Get.height - 40 * LayoutConstant.scaleFactor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: LayoutConstant.screenPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Next workout
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 32 * LayoutConstant.scaleFactor,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Pull Up",
                          maxLines: 2,
                          textAlign: TextAlign.right,
                          style: context.theme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        width: 8 * LayoutConstant.scaleFactor,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.help_outline_rounded,
                          // size: 32.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8 * LayoutConstant.scaleFactor,
                  ),
                  Text(
                    "Next workout ( 4 / 16 )",
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ],
              ),

              // Timer and reps
              GetBuilder<TimerController>(
                builder: (controller) => TimerComponent(
                  count: controller.count,
                  initialCount: controller.initialCount,
                  description: 'Take a rest',
                ),
              ),

              // Buttons
              Column(
                children: [
                  ButtonComponent(
                    onPressed: () {},
                    text: '+ 30 sec',
                    isPrimary: false,
                  ),
                  SizedBox(
                    height: 8 * LayoutConstant.scaleFactor,
                  ),
                  ButtonComponent(
                    onPressed: () {},
                    text: 'Skip',
                  ),
                  SizedBox(
                    height: 16 * LayoutConstant.scaleFactor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
