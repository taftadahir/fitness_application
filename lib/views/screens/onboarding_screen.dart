import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/onboarding_controller.dart';
import 'package:fitness_application/views/components/button_component.dart';
import 'package:fitness_application/views/components/dot_component.dart';
import 'package:fitness_application/views/components/onboarding_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      body: GetBuilder<OnboardingController>(builder: (controller) {
        return SingleChildScrollView(
          physics: AppTheme.scrollPhysic,
          child: Container(
            constraints: BoxConstraints(minHeight: Get.height),
            padding: EdgeInsets.only(
              top: LayoutConstant.screenPadding,
              left: LayoutConstant.screenPadding,
              right: LayoutConstant.screenPadding,
              bottom: 24 * LayoutConstant.scaleFactor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.activeIndex == 0
                        ? const SizedBox()
                        : IconButton(
                            icon: const Icon(EvaIcons.arrowBackOutline),
                            onPressed: () {
                              pageController.previousPage(
                                duration: AppTheme.animationDuration,
                                curve: Curves.bounceIn,
                              );
                            },
                          ),
                    controller.activeIndex == controller.datas.length - 1
                        ? const SizedBox()
                        : TextButton(
                            onPressed: () {
                              pageController.jumpToPage(
                                controller.datas.length - 1,
                              );
                            },
                            child: const Text('SKIP'),
                          ),
                  ],
                ),
                SizedBox(
                  height: 80 * LayoutConstant.scaleFactor,
                ),
                SizedBox(
                  height: context.height - 264 * LayoutConstant.scaleFactor,
                  child: PageView.builder(
                    physics: AppTheme.scrollPhysic,
                    controller: pageController,
                    onPageChanged: (int index) =>
                        controller.activeIndex = index,
                    itemCount: controller.datas.length,
                    itemBuilder: (_, index) => OnboardingComponent(
                      onboarding: controller.datas[index],
                    ),
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
                      controller.datas.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8 * LayoutConstant.scaleFactor,
                        ),
                        child: DotComponent(
                          active: controller.activeIndex == index,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24 * LayoutConstant.scaleFactor,
                ),
                ButtonComponent(
                    onPressed: () {
                      if (!(controller.activeIndex ==
                          controller.datas.length - 1)) {
                        pageController.nextPage(
                          duration: AppTheme.animationDuration,
                          curve: Curves.bounceIn,
                        );
                      }
                    },
                    text: controller.activeIndex == controller.datas.length - 1
                        ? 'CONTINUE'
                        : 'NEXT'),
              ],
            ),
          ),
        );
      }),
    );
  }
}
