import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/models/program.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgramCardComponent extends StatelessWidget {
  final Program program;
  const CustomProgramCardComponent({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.cardColor,
      elevation: LayoutConstant.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutConstant.cardRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(LayoutConstant.cardRadius),
        splashColor: context.theme.cardColor,
        focusColor: context.theme.cardColor,
        highlightColor: context.theme.cardColor,
        onTap: () {
          // TODO: Update the program field from Program Controller
          ProgramController programController = Get.find();
          programController.program = program;

          // TODO: Update the active day
          if (programController.program!.lastCompletedDay < program.days) {
            programController.activeDay = program.lastCompletedDay + 1;
          } else {
            programController.activeDay = program.lastCompletedDay;
          }

          // TODO: Go to custom program screen
          Get.toNamed(RouteConstant.customProgramScreen);
        },
        child: Container(
          constraints: BoxConstraints(
            minHeight: LayoutConstant.programCardHeight,
          ),
          padding: EdgeInsets.all(16 * LayoutConstant.scaleFactor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      program.name,
                      style: context.theme.textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 4 * LayoutConstant.scaleFactor,
                    ),
                    Text(
                      'Build your own training program !',
                      style: context.theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8 * LayoutConstant.scaleFactor,
              ),
              Container(
                height: 24 * LayoutConstant.scaleFactor,
                width: 24 * LayoutConstant.scaleFactor,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(4 * LayoutConstant.scaleFactor),
                  border: Border.all(
                    width: 1,
                    color: context.theme.canvasColor,
                  ),
                ),
                child: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
