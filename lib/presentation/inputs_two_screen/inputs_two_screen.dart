import 'bloc/inputs_two_bloc.dart';
import 'models/inputs_two_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/core/utils/validation_functions.dart';
import 'package:maharishiji/widgets/custom_button.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';

class InputsTwoScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<InputsTwoBloc>(
      create: (context) => InputsTwoBloc(InputsTwoState(
        inputsTwoModelObj: InputsTwoModel(),
      ))
        ..add(InputsTwoInitialEvent()),
      child: InputsTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: getHorizontalSize(
              445,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: getPadding(
                      top: 8,
                    ),
                    child: Padding(
                      padding: getPadding(
                        left: 8,
                        right: 8,
                        bottom: 235,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            child: Container(
                              width: getHorizontalSize(
                                429,
                              ),
                              padding: getPadding(
                                left: 32,
                                top: 29,
                                right: 32,
                                bottom: 29,
                              ),
                              decoration: AppDecoration.fillGray10001,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 14,
                                    ),
                                    child: Text(
                                      "lbl_interactions".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterRegular12,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 9,
                                    ),
                                    child: Text(
                                      "lbl_inputs".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 32,
                              top: 33,
                            ),
                            child: Text(
                              "lbl_input_text".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular12,
                            ),
                          ),
                          BlocSelector<InputsTwoBloc, InputsTwoState,
                              TextEditingController?>(
                            selector: (state) => state.nameController,
                            builder: (context, nameController) {
                              return CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: nameController,
                                hintText: "lbl_name".tr,
                                margin: getMargin(
                                  left: 32,
                                  top: 6,
                                  right: 54,
                                ),
                                variant: TextFormFieldVariant.OutlineGray20001,
                                shape: TextFormFieldShape.RoundedBorder8,
                                fontStyle: TextFormFieldFontStyle.InterMedium16,
                                validator: (value) {
                                  if (!isText(value)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                          Padding(
                            padding: getPadding(
                              left: 32,
                              top: 17,
                            ),
                            child: Text(
                              "msg_input_searchorsend".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular12,
                            ),
                          ),
                          BlocSelector<InputsTwoBloc, InputsTwoState,
                              TextEditingController?>(
                            selector: (state) => state.searchController,
                            builder: (context, searchController) {
                              return CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: searchController,
                                hintText: "lbl_search".tr,
                                margin: getMargin(
                                  left: 32,
                                  top: 6,
                                  right: 54,
                                ),
                                variant: TextFormFieldVariant.OutlineGray20001,
                                fontStyle: TextFormFieldFontStyle.InterMedium16,
                              );
                            },
                          ),
                          Padding(
                            padding: getPadding(
                              left: 32,
                              top: 17,
                            ),
                            child: Text(
                              "msg_segmented_control_structure".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular12,
                            ),
                          ),
                          Container(
                            margin: getMargin(
                              left: 32,
                              top: 6,
                              right: 54,
                            ),
                            padding: getPadding(
                              all: 2,
                            ),
                            decoration:
                                AppDecoration.outlineGray200011.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder25,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: getVerticalSize(
                                    46,
                                  ),
                                  width: getHorizontalSize(
                                    171,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "lbl_search".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtInterMedium16Gray400,
                                        ),
                                      ),
                                      CustomButton(
                                        height: getVerticalSize(
                                          46,
                                        ),
                                        width: getHorizontalSize(
                                          171,
                                        ),
                                        text: "lbl_search".tr,
                                        variant: ButtonVariant.White,
                                        fontStyle: ButtonFontStyle
                                            .InterSemiBold16Gray400,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 54,
                                    top: 13,
                                    right: 59,
                                    bottom: 12,
                                  ),
                                  child: Text(
                                    "lbl_search".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterMedium16Gray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 32,
                              top: 17,
                            ),
                            child: Text(
                              "msg_segmented_control_left".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular12,
                            ),
                          ),
                          Container(
                            margin: getMargin(
                              left: 32,
                              top: 6,
                              right: 54,
                            ),
                            padding: getPadding(
                              all: 2,
                            ),
                            decoration:
                                AppDecoration.outlineGray200011.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder25,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: getVerticalSize(
                                    46,
                                  ),
                                  width: getHorizontalSize(
                                    171,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "lbl_search".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtInterMedium16Gray400,
                                        ),
                                      ),
                                      CustomButton(
                                        height: getVerticalSize(
                                          46,
                                        ),
                                        width: getHorizontalSize(
                                          171,
                                        ),
                                        text: "lbl_search".tr,
                                        variant: ButtonVariant.White,
                                        fontStyle: ButtonFontStyle
                                            .InterSemiBold16Green400,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 54,
                                    top: 13,
                                    right: 59,
                                    bottom: 12,
                                  ),
                                  child: Text(
                                    "lbl_search".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterMedium16Gray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 32,
                              top: 17,
                            ),
                            child: Text(
                              "msg_segmented_control_right".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular12,
                            ),
                          ),
                          Container(
                            margin: getMargin(
                              left: 32,
                              top: 6,
                              right: 54,
                            ),
                            padding: getPadding(
                              all: 2,
                            ),
                            decoration:
                                AppDecoration.outlineGray200011.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder25,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 58,
                                    top: 13,
                                    bottom: 12,
                                  ),
                                  child: Text(
                                    "lbl_search".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterMedium16Gray400,
                                  ),
                                ),
                                Container(
                                  height: getVerticalSize(
                                    46,
                                  ),
                                  width: getHorizontalSize(
                                    171,
                                  ),
                                  margin: getMargin(
                                    left: 54,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "lbl_search".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtInterMedium16Gray400,
                                        ),
                                      ),
                                      CustomButton(
                                        height: getVerticalSize(
                                          46,
                                        ),
                                        width: getHorizontalSize(
                                          171,
                                        ),
                                        text: "lbl_search".tr,
                                        variant: ButtonVariant.White,
                                        fontStyle: ButtonFontStyle
                                            .InterSemiBold16Green400,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 32,
                              top: 16,
                            ),
                            child: Text(
                              "msg_radio_unselected".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular12,
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              34,
                            ),
                            width: getHorizontalSize(
                              343,
                            ),
                            margin: getMargin(
                              left: 32,
                              top: 25,
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                BlocSelector<InputsTwoBloc, InputsTwoState,
                                    TextEditingController?>(
                                  selector: (state) =>
                                      state.groupfortytwoController,
                                  builder: (context, groupfortytwoController) {
                                    return CustomTextFormField(
                                      width: getHorizontalSize(
                                        343,
                                      ),
                                      focusNode: FocusNode(),
                                      autofocus: true,
                                      controller: groupfortytwoController,
                                      hintText: "msg_radio_option_here".tr,
                                      alignment: Alignment.center,
                                    );
                                  },
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: getSize(
                                      16,
                                    ),
                                    width: getSize(
                                      16,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          8,
                                        ),
                                      ),
                                      border: Border.all(
                                        color: ColorConstant.gray400,
                                        width: getHorizontalSize(
                                          1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 32,
                              top: 14,
                            ),
                            child: Text(
                              "msg_radio_unselected".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular12,
                            ),
                          ),
                          BlocSelector<InputsTwoBloc, InputsTwoState,
                              TextEditingController?>(
                            selector: (state) => state.radioselectedController,
                            builder: (context, radioselectedController) {
                              return CustomTextFormField(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: radioselectedController,
                                hintText: "msg_radio_option_here".tr,
                                margin: getMargin(
                                  left: 32,
                                  top: 25,
                                  right: 54,
                                ),
                                textInputAction: TextInputAction.done,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
