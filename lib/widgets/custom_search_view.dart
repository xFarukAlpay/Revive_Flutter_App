import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension SearchViewStyleHelper on CustomSearchView {
  static OutlineInputBorder get fillOnErrorContainer => OutlineInputBorder(
    borderSide: BorderSide.none,
  );
}

class CustomSearchView extends StatelessWidget {
  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText = "Arama yapiniz",
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
        alignment: alignment!,
        child: searchViewWidget(context))
        : searchViewWidget(context);
  }

  Widget searchViewWidget(BuildContext context) => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: TextFormField(
        scrollPadding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        controller: controller,
        focusNode: focusNode,
        onTapOutside: (event) {
          if (focusNode != null) {
            focusNode!.unfocus();
          } else {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        autofocus: autofocus,
        style: textStyle ?? CustomTextStyles.bodySmallGray500,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: decoration,
        validator: validator,
        onChanged: (String value) {
          onChanged?.call(value);
        }),
  );

  InputDecoration get decoration => InputDecoration(
    hintText: hintText,
    hintStyle: hintStyle ?? CustomTextStyles.bodySmallOnErrorContainer,
    prefixIcon: prefix ??
        Container(
          margin: EdgeInsets.fromLTRB(34.h, 12.h, 12.h, 12.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgSearch,
            height: 24.h,
            width: 22.h,
          ),
        ),
    prefixIconConstraints: prefixConstraints ??
        BoxConstraints(
          maxHeight: 48.h,
        ),
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.all(12.h),
    fillColor: fillColor ?? appTheme.red700,
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.h),
          borderSide: BorderSide(
            color: theme.colorScheme.onErrorContainer,
            width: 1,
          ),
        ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: theme.colorScheme.onErrorContainer,
            width: 1,
          ),
        ),
    focusedBorder: (borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ))
        .copyWith(
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
      ),
    ),
  );
}
