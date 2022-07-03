import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/exercise_card_component.dart';
import 'package:fitness_application/views/components/program_card_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.arrowBackOutline),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.searchOutline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(EvaIcons.options2Outline),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<ProgramController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32 * LayoutConstant.scaleFactor,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 40 * LayoutConstant.scaleFactor,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 4 * LayoutConstant.scaleFactor,
                vertical: 4 * LayoutConstant.scaleFactor,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.theme.iconTheme.color!,
                  width: LayoutConstant.scaleFactor,
                ),
                borderRadius: BorderRadius.circular(
                  40 * LayoutConstant.scaleFactor,
                ),
              ),
              child: TabBar(
                controller: controller.tabController,
                splashBorderRadius: BorderRadius.circular(
                  40 * LayoutConstant.scaleFactor,
                ),
                indicator: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(
                    40 * LayoutConstant.scaleFactor,
                  ),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'Exercises',
                      style: context.theme.textTheme.headlineMedium,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Programs',
                      style: context.theme.textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24 * LayoutConstant.scaleFactor,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  GridView.builder(
                    padding: EdgeInsets.only(
                      left: LayoutConstant.screenPadding,
                      right: LayoutConstant.screenPadding,
                      bottom: LayoutConstant.screenPadding,
                    ),
                    physics: AppTheme.scrollPhysic,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: LayoutConstant.screenPadding,
                      mainAxisSpacing: LayoutConstant.screenPadding,
                    ),
                    itemCount: controller.exercises.length,
                    itemBuilder: (context, index) {
                      return ExerciseCardComponent(
                        exercise: controller.exercises[index],
                      );
                    },
                  ),
                  ListView(
                    padding: EdgeInsets.only(
                      left: LayoutConstant.screenPadding,
                      right: LayoutConstant.screenPadding,
                      bottom: LayoutConstant.screenPadding,
                    ),
                    physics: AppTheme.scrollPhysic,
                    children: controller.allPrograms
                        .map(
                          (program) => Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 4 * LayoutConstant.scaleFactor,
                            ),
                            child: ProgramCardComponent(program: program),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
