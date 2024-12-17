import 'package:flutter/material.dart';
import '../../core/app_export.dart';


enum Style { bgFill }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
      key: key,
  );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 48.0, // Adjusted to standard value
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
    SizeUtils.width, // Ensure this is a valid size
    height ?? 48.h, // Adjusted to standard value
  );

  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 26.h, // Adjusted to standard value
          width: 212.h, // Adjusted to standard value
          decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer,
          ),
        );
      default:
        return null;
    }
  }
}
