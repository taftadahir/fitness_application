import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/dot_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

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
            icon: const Icon(EvaIcons.heartOutline),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<ProgramController>(
        builder: (controller) {
          return controller.exercise != null
              ? ListView(
                  physics: AppTheme.scrollPhysic,
                  padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstant.screenPadding,
                  ),
                  children: [
                    SizedBox(
                      height: 16 * LayoutConstant.scaleFactor,
                    ),
                    controller.images == null || controller.images!.isEmpty
                        ? const SizedBox(
                            height: 200,
                            child: Center(child: Text('No images')),
                          )
                        : SizedBox(
                            height:
                                Get.width - 2 * LayoutConstant.screenPadding,
                            child: PageView.builder(
                              controller: pageController,
                              physics: AppTheme.scrollPhysic,
                              itemCount: controller.images?.length,
                              onPageChanged: (index) {
                                controller.activeImageIndex = index;
                              },
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  'assets/images/${controller.images![controller.activeImageIndex]}',
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
                          controller.images!.length,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8 * LayoutConstant.scaleFactor,
                            ),
                            child: DotComponent(
                              active: controller.activeImageIndex == index,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24 * LayoutConstant.scaleFactor,
                    ),
                    Text(
                      controller.exercise!.name,
                      textAlign: TextAlign.left,
                      style: context.theme.textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 16 * LayoutConstant.scaleFactor,
                    ),
                    Text(
                      controller.exercise!.details ?? 'No details',
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: LayoutConstant.screenPadding,
                    ),
                  ],
                )
              : const SizedBox(
                  height: 200,
                  child: Center(
                    child: Text("No exercise"),
                  ),
                );
        },
      ),
    );
  }
}
