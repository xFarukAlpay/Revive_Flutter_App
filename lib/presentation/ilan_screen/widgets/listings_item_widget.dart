import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/listings_item_model.dart';

// ignore_for_file: must_be_immutable
// !!! Burası ilanlan sayfasındaki ilanların
// padding, margin ayarlarının ve yerleştirme yapıldığı yer
class ListingsItemWidget extends StatelessWidget {
  ListingsItemWidget(this.listingsItemModelObj, {Key? key}) : super(key: key);

  ListingsItemModel listingsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onErrorContainer,
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: listingsItemModelObj.image!,
            height: 70.h,
            width: 110.h,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 4.h),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28), // Tutarlı hale getirildi
                  child: Text(
                    listingsItemModelObj.barefootbeach!,
                    style: CustomTextStyles.bodyMediumSedanOnPrimaryContainer,
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.only(left: 28), // Tutarlı hale getirildi
                  child: Text(
                    listingsItemModelObj.sandytoesand!,
                    style: CustomTextStyles.bodySmallGray500,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 28), // Tutarlı hale getirildi
                      child: Text(
                        listingsItemModelObj.wilmoth!,
                        style: CustomTextStyles.bodySmallErrorContainer,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6.h),
                      padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: appTheme.indigoA70019,
                        borderRadius: BorderRadiusStyle.roundedBorder2,
                      ),
                      child: Text(
                        listingsItemModelObj.tag!,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodySmallIndigoA700,
                      ),
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
