import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/setting_controller.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.arrowBackOutline),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Reset all programs'),
      ),
      body: ListView(
        physics: AppTheme.scrollPhysic,
        padding: EdgeInsets.symmetric(
          horizontal: LayoutConstant.screenPadding,
        ),
        children: [
          SizedBox(
            height: 24 * LayoutConstant.scaleFactor,
          ),
          Center(
            child: Text(
              "Setting",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 24 * LayoutConstant.scaleFactor,
          ),
          GetBuilder<SettingController>(
            builder: (controller) {
              return Column(
                children: [
                  SwitchListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    title: Text(
                      'Dark theme',
                      style: context.theme.textTheme.headlineLarge,
                    ),
                    value: controller.isDark,
                    onChanged: (value) {
                      controller.isDark = value;
                    },
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    title: Text(
                      'Language',
                      style: context.theme.textTheme.headlineLarge,
                    ),
                    trailing: Text(
                      'English',
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    title: Text(
                      'Count down',
                      style: context.theme.textTheme.headlineLarge,
                    ),
                    trailing: Text(
                      '30 secs',
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    title: Text(
                      'Unit',
                      style: context.theme.textTheme.headlineLarge,
                    ),
                    trailing: Text(
                      'kg / meter',
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    onTap: () {},
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
