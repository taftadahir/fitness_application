import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/models/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingComponent extends StatelessWidget {
  final Onboarding onboarding;

  const OnboardingComponent({
    Key? key,
    required this.onboarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SvgPicture.asset(
            'assets/images/${onboarding.image}',
          ),
        ),
        SizedBox(height: 40 * LayoutConstant.scaleFactor),
        Text(
          onboarding.title,
          style: context.theme.textTheme.labelLarge,
        ),
        SizedBox(height: 16 * LayoutConstant.scaleFactor),
        Text(
          onboarding.description,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
