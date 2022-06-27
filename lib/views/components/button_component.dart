import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const ButtonComponent({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: isPrimary
          ? null
          : context.theme.elevatedButtonTheme.style!.copyWith(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.cardColor),
            ),
      child: Text(
        text,
      ),
    );
  }
}
