import 'dart:convert';

import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseCardComponent extends StatelessWidget {
  final Exercise exercise;
  final void Function()? onTap;

  const ExerciseCardComponent({
    Key? key,
    required this.exercise,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List images = jsonDecode((exercise.images == null || exercise.images == '')
        ? "[]"
        : exercise.images!) as List<dynamic>;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LayoutConstant.cardRadius),
          color: context.theme.cardColor,
          image: images.isEmpty
              ? null
              : DecorationImage(
                  image: AssetImage(
                    'assets/images/${images[0] as String}',
                  ),
                ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16 * LayoutConstant.scaleFactor,
          vertical: 16 * LayoutConstant.scaleFactor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              exercise.name,
              style: context.theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
