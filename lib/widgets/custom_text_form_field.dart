import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineGrayTl22 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(22.h),
    borderSide: BorderSide(
      color: appTheme.gray30001,
      width: 1,
    ),
  );
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
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
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
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
  final bool? filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: textFormFieldWidget(context),
    )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: TextFormField(
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) {
        if (focusNode != null) {
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      autofocus: autofocus!,
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      obscureText: obscureText!,
      readOnly: readOnly!,
      onTap: () {
        onTap?.call();
      },
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration(context),
      validator: validator,
    ),
  );

  InputDecoration decoration(BuildContext context) => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding:
    contentPadding ?? EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 14.0),
    fillColor: fillColor ?? Theme.of(context).colorScheme.onErrorContainer,
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
    focusedBorder: (borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ))
        .copyWith(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 1,
      ),
    ),
  );
}
