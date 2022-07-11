import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/timer_controller.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/button_component.dart';
import 'package:fitness_application/views/components/timer_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutOnScreen extends StatelessWidget {
  const WorkoutOnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.close),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.autorenew_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(EvaIcons.arrowheadRightOutline),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AppTheme.scrollPhysic,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: Get.height - 40 * LayoutConstant.scaleFactor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: LayoutConstant.screenPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 16 * LayoutConstant.scaleFactor,
              ),

              // Add Image
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/front_lever.png',
                  ),
                ),
              ),
              SizedBox(
                height: 24 * LayoutConstant.scaleFactor,
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Add Title and help
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
                    height: 24 * LayoutConstant.scaleFactor,
                  ),

                  // Add timer
                  GetBuilder<TimerController>(
                    builder: (controller) => TimerComponent(
                      count: controller.count,
                      initialCount: controller.initialCount,
                      description: 'Seconds left',
                    ),
                  ),
                  SizedBox(
                    height: 24 * LayoutConstant.scaleFactor,
                  ),

                  // Add buttons
                  ButtonComponent(
                    onPressed: () {},
                    text: 'Done',
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
