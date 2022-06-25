import 'package:fitness_application/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              ThemeService.switchTheme();
            },
            child: Text('Change theme'),
          ),
          Text('data'),
        ],
      ),
    );
  }
}
