import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/listplaytwo_one_item_model.dart';

// ignore_for_file: must_be_immutable

class ListplaytwoOneItemWidget extends StatelessWidget {
  ListplaytwoOneItemWidget(this.listplaytwoOneItemModelObj, {Key? key}) : super(key: key);

  final ListplaytwoOneItemModel listplaytwoOneItemModelObj;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context); // Tema için ekledim

    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            height: 48.h,
            width: 48.h,
            padding: EdgeInsets.all(16.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgPlay2Onerrorcontainer, // CustomImageView parametreleri düzeltildi
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align edilmesi gereken eksen düzeltildi
              children: [
                Text(
                  listplaytwoOneItemModelObj.myfavorite!,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_316".tr, // .tr kullanarak yerelleştirme eklenmiş
                            style: theme.textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: "lbl_kilometre".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 26.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_12".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: "lbl_saat".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
