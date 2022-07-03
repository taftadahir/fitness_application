import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/register_controller.dart';
import 'package:fitness_application/services/storage_service.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
      floatingActionButton:
          GetBuilder<RegisterController>(builder: (controller) {
        return FloatingActionButton.extended(
          onPressed: () {
            if (!controller.profileReadOnly) {
              // Save
              // controller.register();
            }
            controller.profileReadOnly = !controller.profileReadOnly;
          },
          label: Text(controller.profileReadOnly ? 'Update' : 'Save'),
        );
      }),
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
              "Profile",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 24 * LayoutConstant.scaleFactor,
          ),
          GetBuilder<RegisterController>(builder: (controller) {
            return Form(
              key: controller.registerFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) => null,
                    initialValue: controller.profileReadOnly
                        ? StorageService.firstname
                        : null,
                    readOnly: controller.profileReadOnly,
                    keyboardType: TextInputType.text,
                    style: context.theme.textTheme.headlineMedium,
                    onSaved: (value) => controller.firstname = value!,
                    controller: controller.profileReadOnly
                        ? null
                        : controller.firstnameController,
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
                    initialValue: controller.profileReadOnly
                        ? StorageService.lastname
                        : null,
                    readOnly: controller.profileReadOnly,
                    keyboardType: TextInputType.text,
                    style: context.theme.textTheme.headlineMedium,
                    onSaved: (value) => controller.lastname = value!,
                    controller: controller.profileReadOnly
                        ? null
                        : controller.lastnameController,
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
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
