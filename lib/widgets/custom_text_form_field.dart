import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.padding,
      this.shape,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldPadding? padding;

  TextFormFieldShape? shape;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? autofocus;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus!,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.InterMedium16:
        return TextStyle(
          color: ColorConstant.gray400,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.InterRegular14:
        return TextStyle(
          color: ColorConstant.gray700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      case TextFormFieldShape.RoundedBorder4:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineGray20001:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray20001,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineGray20001_1:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray20001,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineGreen600:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.green600,
            width: 1,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.gray20001,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.OutlineGray20001:
        return ColorConstant.gray100;
      case TextFormFieldVariant.OutlineGray20001_1:
        return ColorConstant.gray100;
      case TextFormFieldVariant.OutlineGreen600:
        return ColorConstant.green400;
      default:
        return null;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.UnderLineGray20001:
        return false;
      case TextFormFieldVariant.OutlineGray20001:
        return true;
      case TextFormFieldVariant.OutlineGray20001_1:
        return true;
      case TextFormFieldVariant.OutlineGreen600:
        return true;
      case TextFormFieldVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT15:
        return getPadding(
          left: 15,
          top: 15,
          bottom: 15,
        );
      default:
        return getPadding(
          all: 15,
        );
    }
  }
}

enum TextFormFieldPadding {
  PaddingAll15,
  PaddingT15,
}

enum TextFormFieldShape {
  RoundedBorder8,
  CircleBorder25,
  RoundedBorder4,
}

enum TextFormFieldVariant {
  None,
  UnderLineGray20001,
  OutlineGray20001,
  OutlineGray20001_1,
  OutlineGreen600,
}

enum TextFormFieldFontStyle {
  InterMedium16Black900,
  InterMedium16,
  InterRegular14,
}
