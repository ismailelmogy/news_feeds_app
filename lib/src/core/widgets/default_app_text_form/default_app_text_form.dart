import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/app_colors.dart';

class DefaultAppTextForm extends StatelessWidget {
  final bool enabled;
  final String? initialValue;
  final bool autofocus;
  final String? hintTxt;
  final bool borderIsEnabled;
  final bool marginIsEnabled;
  final TextInputType? inputData;
  final double radius;
  final bool readOnly;
  final Color? focusedBorderColor;
  final String? Function(String?)? validationFunction;
  final dynamic Function(String?)? onChangedFunction;
  final ValueChanged<String>? onFieldSubmitted;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? labelTxt;
  final bool expands;
  final FocusNode? focusNode;
  final double? verticalPadding;
  final double? horizontalPadding;
  final TextEditingController? controller;
  final Color? unfocusColor;
  final Color? hintColor;
  final Color? focusColor;
  final Color? filledColor;
  final bool filled;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode autovalidateMode;
  final TextInputAction? textInputAction;
  final String? helperText;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;

  const DefaultAppTextForm(
      {Key? key,
      this.hintTxt,
      this.onFieldSubmitted,
      this.inputData,
      this.autofocus = false,
      this.borderIsEnabled = true,
      this.readOnly = false,
      this.obscureText = false,
      this.validationFunction,
      this.onChangedFunction,
      this.focusedBorderColor,
      this.initialValue,
      this.verticalPadding,
      this.horizontalPadding,
      this.suffixIcon,
      this.radius = 30,
      this.focusNode,
      this.maxLength,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.enabled = true,
      this.maxLines,
      this.expands = false,
      this.labelTxt,
      this.prefix,
      this.unfocusColor,
      this.hintColor,
      this.focusColor,
      this.suffix,
      this.filled = true,
      this.marginIsEnabled = true,
      this.filledColor,
      this.prefixIcon,
      this.controller,
      this.inputFormatters,
      this.textInputAction,
      this.onEditingComplete,
      this.onTap,
      this.hintStyle,
      this.helperText,
      this.errorStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: marginIsEnabled ? 16 : 0),
        child: TextFormField(
          autofocus: autofocus,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onTap: onTap,
          readOnly: readOnly,
          textInputAction: textInputAction,
          autovalidateMode: autovalidateMode,
          inputFormatters: inputFormatters,
          expands: expands,
          controller: controller,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          initialValue: initialValue,
          style: Theme.of(context).textTheme.labelSmall,
          decoration: InputDecoration(
            helperText: helperText,
            filled: filled ? true : false,
            fillColor: filledColor ?? Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 20,
                horizontal: horizontalPadding ?? 12),
            errorStyle: errorStyle,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: Colors.red)),
            suffix: suffix,
            suffixIcon: suffixIcon,
            border: !borderIsEnabled
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: const BorderSide(color: AppColors.borderColor)),
            enabledBorder: !borderIsEnabled
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: const BorderSide(color: AppColors.borderColor)),
            focusedBorder: !borderIsEnabled
                ? InputBorder.none
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        color: focusedBorderColor ?? AppColors.primaryColor,
                        width: 1),
                    borderRadius: BorderRadius.circular(radius),
                  ),
            prefix: prefix,
            prefixIcon: prefixIcon,
            hintText: hintTxt,
            labelText: labelTxt,
            hintStyle: Theme.of(context).textTheme.titleSmall,
          ),
          keyboardType: inputData,
          obscureText: obscureText,
          validator: validationFunction,
          onChanged: onChangedFunction,
        ));
  }
}
