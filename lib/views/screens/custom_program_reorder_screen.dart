import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/reorder_controller.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/workout_card_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgramReorderScreen extends StatelessWidget {
  const CustomProgramReorderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReorderController>(builder: (controller) {
      return Scaffold(
        appBar: AppbarComponent(
          leading: IconButton(
            icon: const Icon(EvaIcons.arrowBackOutline),
            onPressed: () {},
          ),
          actions: [
            TextButton(
              onPressed: controller.save,
              child: const Text('Save'),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 32 * LayoutConstant.scaleFactor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: LayoutConstant.screenPadding,
              ),
              child: Center(
                child: Text(
                  "Warm Up",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(
              height: 16 * LayoutConstant.scaleFactor,
            ),
            Expanded(
              child: ReorderableListView(
                physics: AppTheme.scrollPhysic,
                padding: EdgeInsets.symmetric(
                  horizontal: LayoutConstant.screenPadding,
                ),
                onReorder: controller.onReorder,
                children: controller.workouts
                    .map(
                      (workout) => Padding(
                        key: ValueKey(workout),
                        padding: EdgeInsets.only(
                          bottom: 8 * LayoutConstant.scaleFactor,
                        ),
                        child: WorkoutCardComponent(workout: workout),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
