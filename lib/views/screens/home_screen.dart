import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/models/program.dart';
import 'package:fitness_application/views/components/custom_program_card_component.dart';
import 'package:fitness_application/views/components/program_card_component.dart';
import 'package:fitness_application/views/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_application/controllers/drawer_controller.dart'
    as drawer;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProgramController programController = Get.find();
    drawer.DrawerController drawerController1 = Get.find();

    Scaffold home = Scaffold(
      body: Column(
        children: [
          // App Bar
          Padding(
            padding: EdgeInsets.only(
              top: LayoutConstant.screenPadding,
              left: LayoutConstant.screenPadding,
              right: LayoutConstant.screenPadding,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: drawerController1.openDrawer,
                  icon: const Icon(Icons.scatter_plot_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
          ),

          // Body
          Expanded(
            child: ListView(
              physics: AppTheme.scrollPhysic,
              children: [
                // Greeting
                SizedBox(
                  height: 56 * LayoutConstant.scaleFactor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstant.screenPadding,
                  ),
                  child: Text(
                    'Hello John',
                    style: context.theme.textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 4 * LayoutConstant.scaleFactor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstant.screenPadding,
                  ),
                  child: Text(
                    'Welcome Back !',
                    style: context.theme.textTheme.displaySmall,
                  ),
                ),

                // Custom program
                SizedBox(
                  height: 24 * LayoutConstant.scaleFactor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstant.screenPadding,
                  ),
                  child: CustomProgramCardComponent(
                    program: Program(
                      sysId: 'sysId',
                      name: 'Custom program',
                      level: ProgramLevel.starter,
                      days: 30,
                      status: ProgramStatus.notStarted,
                    ),
                  ),
                ),

                // Skills programs
                ...programsUI(
                  context,
                  title: 'Skills',
                  programs: programController.recommendedPrograms,
                ),

                // Starter
                ...programsUI(
                  context,
                  title: 'Starter',
                  programs: programController.recommendedPrograms,
                ),

                // Gain muscle
                ...programsUI(
                  context,
                  title: 'Gain muscle',
                  programs: programController.recommendedPrograms,
                ),

                // Gain Strength
                ...programsUI(
                  context,
                  title: 'Gain strength',
                  programs: programController.recommendedPrograms,
                ),

                // Bottom space
                SizedBox(
                  height: 16 * LayoutConstant.scaleFactor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return Stack(
      children: [
        const DrawerScreen(),
        GetBuilder<drawer.DrawerController>(builder: (drawerController) {
          return WillPopScope(
            onWillPop: () async {
              if (drawerController.isDrawerOpen) {
                drawerController.closeDrawer();
                return false;
              } else {
                return true;
              }
            },
            child: GestureDetector(
              onTap: drawerController.closeDrawer,
              child: AnimatedContainer(
                transform: Matrix4.translationValues(
                  drawerController.xOffset,
                  drawerController.yOffset,
                  0,
                )..scale(drawerController.scaleFactor),
                duration: const Duration(
                  milliseconds: 250,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    drawerController.isDrawerOpen
                        ? 24 * LayoutConstant.scaleFactor
                        : 0,
                  ),
                  boxShadow: drawerController.isDrawerOpen
                      ? [
                          BoxShadow(
                            color: Get.theme.shadowColor,
                            offset: const Offset(-8, 0),
                            spreadRadius: 8,
                            blurRadius: 16,
                          )
                        ]
                      : [],
                ),
                child: AbsorbPointer(
                  absorbing: drawerController.isDrawerOpen,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        drawerController.isDrawerOpen
                            ? 24 * LayoutConstant.scaleFactor
                            : 0),
                    child: home,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  List<Widget> programsUI(
    BuildContext context, {
    required String title,
    required List<Program> programs,
  }) {
    return [
      SizedBox(
        height: 32 * LayoutConstant.scaleFactor,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutConstant.screenPadding,
        ),
        child: Text(
          title,
          style: context.textTheme.titleLarge,
        ),
      ),
      SizedBox(
        height: LayoutConstant.spaceBetweenTitleAndElements,
      ),
      SizedBox(
        height: LayoutConstant.programCardHeight,
        child: ListView(
          physics: AppTheme.scrollPhysic,
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: LayoutConstant.spaceBetweenElements / 2,
            ),
            ...programs
                .map(
                  (program) => Container(
                    width: Get.width -
                        2 * LayoutConstant.screenPadding -
                        8 * LayoutConstant.scaleFactor,
                    margin: EdgeInsets.symmetric(
                      horizontal: LayoutConstant.spaceBetweenElements / 4,
                      vertical: 0,
                    ),
                    child: ProgramCardComponent(program: program),
                  ),
                )
                .toList(),
            SizedBox(
              width: LayoutConstant.spaceBetweenElements / 2,
            ),
          ],
        ),
      ),
    ];
  }
}
