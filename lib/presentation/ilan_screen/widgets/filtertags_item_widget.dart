import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/filtertags_item_model.dart';

// ignore_for_file: must_be_immutable

class FiltertagsItemWidget extends StatelessWidget {
  FiltertagsItemWidget(this.filtertagsItemModelObj, {Key? key, this.onSelectedChipView}) : super(key: key);

  FiltertagsItemModel filtertagsItemModelObj;
  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 2.h,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        filtertagsItemModelObj.tagFour!,  // tagFour olarak güncellendi
        style: TextStyle(
          color: (filtertagsItemModelObj.isSelected ?? false)
              ? appTheme.indigoA700
              : Theme.of(context).colorScheme.errorContainer,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: filtertagsItemModelObj.isSelected ?? false,
      backgroundColor: Theme.of(context).colorScheme.onErrorContainer,
      selectedColor: appTheme.indigoA70019,
      shape: (filtertagsItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.indigoA70019.withOpacity(0.2),
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(4.h),
      )
          : RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.gray300,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(4.h),
      ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
