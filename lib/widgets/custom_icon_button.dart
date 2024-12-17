import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomIconButton extends StatelessWidget {

  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.decoration,
    this.padding,
    this.onTap,
    this.child,
  }) : super(key: key);

  final Alignment? alignment;

  final double? height;

  final double? width;

  final BoxDecoration? decoration;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onTap;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center, child: iconButtonWidget)
        : iconButtonWidget;

  }

  Widget get iconButtonWidget => SizedBox(
      height: height ?? 0,
      width: width ?? 0,
      child: DecoratedBox(
        decoration: decoration ??
            BoxDecoration(
              color: appTheme.deepOrange200,
              borderRadius: BorderRadius.circular(20.0), // .h yerine sabit değer kullanıldı
              border: Border.all(
                color: appTheme.deepOrange200,
                width: 2.h, // .h yerine sabit değer kullanıldı
              ),
            ),
        child: IconButton(
          padding: padding ?? EdgeInsets.zero,
          onPressed: onTap,
          icon: child ?? Container(),
        ),
      ),
    );
  }

