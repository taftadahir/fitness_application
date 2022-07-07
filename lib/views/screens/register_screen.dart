import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/register_controller.dart';
import 'package:fitness_application/services/theme_service.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/button_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLight = ThemeService.theme == ThemeMode.light;
    return Scaffold(
      appBar: AppbarComponent(
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Go to Home screen
              // TODO: Drawer should be closed
            },
            child: const Text('Do It Later'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AppTheme.scrollPhysic,
        child: GetBuilder<RegisterController>(builder: (controller) {
          return Form(
            key: controller.registerFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              height: Get.height - 40 * LayoutConstant.scaleFactor,
              padding: EdgeInsets.only(
                top: 40 * LayoutConstant.scaleFactor,
                left: LayoutConstant.screenPadding,
                right: LayoutConstant.screenPadding,
                bottom: 24 * LayoutConstant.scaleFactor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 160 * LayoutConstant.scaleFactor,
                        child: Image.asset(
                          isLight
                              ? 'assets/images/logo_colored_light.png'
                              : 'assets/images/logo_colored_dark.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40 * LayoutConstant.scaleFactor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstant.screenPadding,
                    ),
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: context.theme.textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(
                    height: 32 * LayoutConstant.scaleFactor,
                  ),
                  TextFormField(
                    validator: (value) => null,
                    keyboardType: TextInputType.text,
                    style: context.theme.textTheme.headlineMedium,
                    onSaved: (value) => controller.firstname = value!,
                    controller: controller.firstnameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: LayoutConstant.screenPadding,
                        vertical: 12 * LayoutConstant.scaleFactor,
                      ),
                      label: Text(
                        'First name',
                        style: context.theme.textTheme.displaySmall,
                      ),
                      hintText: 'Enter your first name',
                    ),
                  ),
                  SizedBox(
                    height: 16 * LayoutConstant.scaleFactor,
                  ),
                  TextFormField(
                    validator: (value) => null,
                    keyboardType: TextInputType.text,
                    style: context.theme.textTheme.headlineMedium,
                    onSaved: (value) => controller.lastname = value!,
                    controller: controller.lastnameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: LayoutConstant.screenPadding,
                        vertical: 12 * LayoutConstant.scaleFactor,
                      ),
                      label: Text(
                        'Last name',
                        style: context.theme.textTheme.displaySmall,
                      ),
                      hintText: 'Enter your last name',
                    ),
                  ),
                  SizedBox(
                    height: 24 * LayoutConstant.scaleFactor,
                  ),
                  ButtonComponent(
                    onPressed: controller.register,
                    text: 'Register',
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
