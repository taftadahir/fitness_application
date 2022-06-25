import 'package:get/get.dart';

class AppMessage extends Translations {
  @override
  // TODO: implement languages
  Map<String, Map<String, String>> get keys => {
        'fr_FR': _fr,
        'en_US': _en,
      };

  Map<String, String> get _fr => {};

  Map<String, String> get _en => {};
}
