import 'package:fitness_application/services/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController firstnameController, lastnameController;
  late String firstname, lastname;
  late bool _profileReadOnly;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    firstnameController = TextEditingController(text: StorageService.firstname);
    lastnameController = TextEditingController(text: StorageService.lastname);
    firstname = '';
    lastname = '';
    _profileReadOnly = true;
  }

  // Profile read only
  bool get profileReadOnly => _profileReadOnly;
  set profileReadOnly(bool profileReadOnly) {
    // TODO: Update the profile read only
    _profileReadOnly = profileReadOnly;
    update();
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
