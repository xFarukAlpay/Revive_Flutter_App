import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/function_item_model.dart';

// ignore_for_file: must_be_immutable

class FunctionItemWidget extends StatelessWidget {
  FunctionItemWidget(this.functionItemModelObj, {Key? key}) : super(key: key);

  final FunctionItemModel functionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.h,
      child: Align(
        alignment: Alignment.bottomLeft, // "Alignment.bottom Left" hatalıydı, düzelttim.
        child: SizedBox(
          width: 56.h,
          child: Column(
            children: [
              CustomImageView(
                imagePath: functionItemModelObj.sonSRLer!, // CustomImageView parametreleri düzeltildi.
                height: 30.h,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 12.h),
              ),
              SizedBox(height: 8.h),
              Text(
                functionItemModelObj.recentlyplayed!,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodySmallErrorContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
