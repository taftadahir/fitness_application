import 'package:fitness_application/constants/layout_constant.dart';
import 'package:flutter/material.dart';

class AppbarComponent extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  const AppbarComponent({
    Key? key,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: LayoutConstant.screenPadding,
        left: LayoutConstant.screenPadding,
        right: LayoutConstant.screenPadding,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading == null
              ? const SizedBox(
                  width: 0,
                )
              : leading!,
          actions == null
              ? const SizedBox(
                  width: 0,
                )
              : Row(
                  children: actions!,
                ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(LayoutConstant.appbarHeight);
}
