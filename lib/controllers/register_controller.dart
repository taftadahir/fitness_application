import 'package:fitness_application/services/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController firstnameController, lastnameController;
  late String firstname, lastname;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    firstname = '';
    lastname = '';
  }

  void register() {
    registerFormKey.currentState!.save();
    StorageService.firstname = firstname;
    StorageService.lastname = lastname;
    update();
  }

  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    super.onClose();
  }
}
