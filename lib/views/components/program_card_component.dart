import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/models/program.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramCardComponent extends StatelessWidget {
  final Program program;
  const ProgramCardComponent({
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
        onTap: () {},
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      program.name,
                      style: context.theme.textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 4 * LayoutConstant.scaleFactor,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          program.status.name,
                          style: context.theme.textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width: 8 * LayoutConstant.scaleFactor,
                        ),
                        Container(
                          width: 4 * LayoutConstant.scaleFactor,
                          height: 4 * LayoutConstant.scaleFactor,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                LayoutConstant.scaleFactor),
                            color: context.theme.canvasColor,
                          ),
                        ),
                        SizedBox(
                          width: 8 * LayoutConstant.scaleFactor,
                        ),
                        Text(
                          program.level.name,
                          style: context.theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8 * LayoutConstant.scaleFactor,
              ),
              Container(
                height: 32 * LayoutConstant.scaleFactor,
                width: 32 * LayoutConstant.scaleFactor,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(32 * LayoutConstant.scaleFactor),
                  border: Border.all(
                    width: 1,
                    color: context.theme.canvasColor,
                  ),
                ),
                child: const Center(child: Text('30')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
