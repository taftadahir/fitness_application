import 'package:fitness_application/constants/storage_constant.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _storage = GetStorage();

  // TODO: isDarkMode
  static bool get isDarkMode =>
      _storage.read(StorageConstant.isDarkMode) ?? false;

  static set isDarkMode(bool isDarkMode) =>
      _storage.write(StorageConstant.isDarkMode, isDarkMode);

  // TODO: isFirstTimeOpeningApp
  // static bool get isFirstTimeOpeningApp =>
  //     _storage.read(StorageConstant.isFirstTimeOpeningApp) ?? true;

  // static set isFirstTimeOpeningApp(bool isFirstTimeOpeningApp) => _storage
  //     .write(StorageConstant.isFirstTimeOpeningApp, isFirstTimeOpeningApp);

  // Firstname
  static String? get firstname => _storage.read(StorageConstant.firstname);

  static set firstname(String? firstname) =>
      _storage.write(StorageConstant.firstname, firstname);

  // Lastname
  static String? get lastname => _storage.read(StorageConstant.lastname);

  static set lastname(String? lastname) =>
      _storage.write(StorageConstant.lastname, lastname);

  // Storage getter
  static get storage => _storage;
}
