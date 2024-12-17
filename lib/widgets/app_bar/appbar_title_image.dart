import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarTitleImage extends StatelessWidget {
  AppbarTitleImage({Key? key, this.imagePath, this.onTap, this.margin})
      : super(
      key: key,
  );

  final String? imagePath;

  final Function? onTap;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: SizedBox(
          width: double.maxFinite,
          child: CustomImageView(
            imagePath: imagePath!,
            height: 24.h,  // Adjusted `24.h` to `24.0` for better clarity
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
