import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/controllers/onboarding_controller.dart';
import 'package:fitness_application/models/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_application/controllers/drawer_controller.dart'
    as drawer;

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    drawer.DrawerController controller = Get.find();

    return Scaffold(
      body: SingleChildScrollView(
        physics: AppTheme.scrollPhysic,
        padding: EdgeInsets.symmetric(
          horizontal: LayoutConstant.screenPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48 * LayoutConstant.scaleFactor,
            ),
            IconButton(
              onPressed: () {
                controller.closeDrawer();
              },
              icon: const Icon(Icons.close_rounded),
            ),
            SizedBox(
              height: 16 * LayoutConstant.scaleFactor,
            ),
            Text(
              'Menu',
              style: context.theme.textTheme.displayMedium,
            ),
            SizedBox(
              height: 56 * LayoutConstant.scaleFactor,
            ),
            ...controller.drawerItems
                .map(
                  (item) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8 * LayoutConstant.scaleFactor,
                    ),
                    child: ListTile(
                      leading: Icon(item.iconData),
                      title: Text(
                        item.element.name,
                        style: context.theme.textTheme.headlineLarge,
                      ),
                      onTap: () {
                        switch (item.element) {
                          case DrawerElement.onboarding:
                            // Onboarding element
                            // TODO: Set Onboarding activeIndex to [0]
                            OnboardingController onboardingController =
                                Get.find();
                            onboardingController.activeIndex = 0;

                            // TODO: Go to Onboarding screen
                            Get.offNamed(RouteConstant.onboardingScreen);
                            break;
                          case DrawerElement.home:
                            controller.closeDrawer();
                            break;
                          case DrawerElement.profile:
                            controller.closeDrawer();
                            Get.toNamed(RouteConstant.profileScreen);
                            break;
                          case DrawerElement.favorite:
                            controller.closeDrawer();
                            Get.toNamed(RouteConstant.favoriteScreen);
                            break;
                          case DrawerElement.analytic:
                            controller.closeDrawer();
                            Get.toNamed(RouteConstant.analyticScreen);
                            break;
                          case DrawerElement.setting:
                            controller.closeDrawer();
                            Get.toNamed(RouteConstant.settingScreen);
                            break;
                        }
                      },
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
