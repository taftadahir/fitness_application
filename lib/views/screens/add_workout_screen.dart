import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/controllers/add_workout_controller.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/dot_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWorkoutScreen extends StatelessWidget {
  const AddWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.arrowBackOutline),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.trashOutline),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          GetBuilder<AddWorkoutController>(builder: (controller) {
        return FloatingActionButton.extended(
          onPressed: () {
            if (controller.exercise != null) {
              // TODO: Save the workout
              controller.save();
            } else {
              // TODO: Goto [Choose Exercise]
              Get.toNamed(RouteConstant.addWorkoutChooseExerciseScreen);
            }
          },
          label: Text(controller.exercise != null ? 'Save' : 'Choose exercise'),
        );
      }),
      body: GetBuilder<AddWorkoutController>(builder: (controller) {
        List<Widget> widgets = [
          SizedBox(
            height: 24 * LayoutConstant.scaleFactor,
          ),
          Center(
            child: Text(
              controller.sysId == null ? "Add new workout" : "Update workout",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleLarge,
            ),
          ),
        ];

        if (controller.exercise != null) {
          widgets.addAll(
            [
              SizedBox(
                height: 24 * LayoutConstant.scaleFactor,
              ),
              SizedBox(
                height: Get.width - 2 * LayoutConstant.screenPadding,
                child: controller.exercise == null
                    ? null
                    : PageView.builder(
                        controller: pageController,
                        physics: AppTheme.scrollPhysic,
                        itemCount: 1,
                        onPageChanged: (index) {},
                        itemBuilder: (context, index) {
                          return Image.asset(
                            'assets/images/front_lever.png',
                          );
                        },
                      ),
              ),
              SizedBox(
                height: 24 * LayoutConstant.scaleFactor,
              ),
              SizedBox(
                height: LayoutConstant.activeDotSize,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    1,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8 * LayoutConstant.scaleFactor,
                      ),
                      child: const DotComponent(
                        active: true,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24 * LayoutConstant.scaleFactor,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: TextFormField(
                      validator: (value) => null,
                      initialValue: null,
                      keyboardType: TextInputType.number,
                      style: context.theme.textTheme.headlineMedium,
                      onSaved: (value) => controller.reps = value,
                      controller: controller.repsController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: LayoutConstant.screenPadding,
                          vertical: 12 * LayoutConstant.scaleFactor,
                        ),
                        label: Text(
                          'Reps',
                          style: context.theme.textTheme.displaySmall,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8 * LayoutConstant.scaleFactor,
                  ),
                  Flexible(
                    child: TextFormField(
                      validator: (value) => null,
                      initialValue: null,
                      keyboardType: TextInputType.number,
                      style: context.theme.textTheme.headlineMedium,
                      onSaved: (value) => controller.weight = value,
                      controller: controller.weigthController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: LayoutConstant.screenPadding,
                          vertical: 12 * LayoutConstant.scaleFactor,
                        ),
                        label: Text(
                          'Weight (kg)',
                          style: context.theme.textTheme.displaySmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8 * LayoutConstant.scaleFactor,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: TextFormField(
                      validator: (value) => null,
                      initialValue: null,
                      keyboardType: TextInputType.number,
                      style: context.theme.textTheme.headlineMedium,
                      onSaved: (value) => controller.time = value,
                      controller: controller.timeController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: LayoutConstant.screenPadding,
                          vertical: 12 * LayoutConstant.scaleFactor,
                        ),
                        label: Text(
                          'time (sec)',
                          style: context.theme.textTheme.displaySmall,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8 * LayoutConstant.scaleFactor,
                  ),
                  Flexible(
                    child: TextFormField(
                      validator: (value) => null,
                      initialValue: null,
                      keyboardType: TextInputType.number,
                      style: context.theme.textTheme.headlineMedium,
                      onSaved: (value) => controller.rest = value,
                      controller: controller.restController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: LayoutConstant.screenPadding,
                          vertical: 12 * LayoutConstant.scaleFactor,
                        ),
                        label: Text(
                          'Rest (sec)',
                          style: context.theme.textTheme.displaySmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        widgets.add(SizedBox(
          height: 80 * LayoutConstant.scaleFactor,
        ));

        return Form(
          key: controller.addWorkoutFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            physics: AppTheme.scrollPhysic,
            padding: EdgeInsets.symmetric(
              horizontal: LayoutConstant.screenPadding,
            ),
            children: widgets,
          ),
        );
      }),
    );
  }
}
