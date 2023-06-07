import 'bloc/inputs_bloc.dart';
import 'models/inputs_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/custom_checkbox.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';

class InputsScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<InputsBloc>(
      create: (context) => InputsBloc(InputsState(
        inputsModelObj: InputsModel(),
      ))
        ..add(InputsInitialEvent()),
      child: InputsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
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
                      bottom: 593,
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
                              top: 31,
                              right: 32,
                              bottom: 31,
                            ),
                            decoration: AppDecoration.fillGray10001,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 12,
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
                                    top: 7,
                                  ),
                                  child: Text(
                                    "lbl_checkmark".tr,
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
                            top: 32,
                          ),
                          child: Text(
                            "lbl_icon_checkmark".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular12,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgCheckmark,
                          height: getVerticalSize(
                            6,
                          ),
                          width: getHorizontalSize(
                            7,
                          ),
                          margin: getMargin(
                            left: 32,
                            top: 7,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 32,
                            top: 17,
                          ),
                          child: Text(
                            "lbl_checkbox_empty".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular12,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgVideocamera,
                          height: getSize(
                            16,
                          ),
                          width: getSize(
                            16,
                          ),
                          margin: getMargin(
                            left: 32,
                            top: 6,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 32,
                            top: 16,
                          ),
                          child: Text(
                            "lbl_checkbox_filled".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular12,
                          ),
                        ),
                        BlocSelector<InputsBloc, InputsState,
                            TextEditingController?>(
                          selector: (state) => state.checkboxfilledController,
                          builder: (context, checkboxfilledController) {
                            return CustomTextFormField(
                              width: getSize(
                                16,
                              ),
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: checkboxfilledController,
                              margin: getMargin(
                                left: 32,
                                top: 7,
                              ),
                              variant: TextFormFieldVariant.OutlineGreen600,
                              shape: TextFormFieldShape.RoundedBorder4,
                              suffix: Container(
                                margin: getMargin(
                                  left: 4,
                                  top: 4,
                                  right: 4,
                                  bottom: 5,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgCheckmarkWhiteA700,
                                ),
                              ),
                              suffixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(
                                  16,
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: getPadding(
                            left: 32,
                            top: 17,
                          ),
                          child: Text(
                            "msg_checkbox_option_empty".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular12,
                          ),
                        ),
                        BlocSelector<InputsBloc, InputsState,
                            TextEditingController?>(
                          selector: (state) => state.checkboxoptioneController,
                          builder: (context, checkboxoptioneController) {
                            return CustomTextFormField(
                              width: getHorizontalSize(
                                86,
                              ),
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: checkboxoptioneController,
                              hintText: "lbl_text_here".tr,
                              margin: getMargin(
                                left: 32,
                                top: 7,
                              ),
                              variant: TextFormFieldVariant.None,
                              fontStyle: TextFormFieldFontStyle.InterRegular14,
                              textInputAction: TextInputAction.done,
                              prefix: Container(
                                margin: getMargin(
                                  top: 1,
                                  right: 8,
                                  bottom: 1,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgVideocamera,
                                ),
                              ),
                              prefixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(
                                  17,
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: getPadding(
                            left: 32,
                            top: 16,
                          ),
                          child: Text(
                            "msg_checkbox_option_filled".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular12,
                          ),
                        ),
                        BlocSelector<InputsBloc, InputsState, bool?>(
                          selector: (state) => state.isCheckbox,
                          builder: (context, isCheckbox) {
                            return CustomCheckbox(
                              text: "lbl_text_here".tr,
                              value: isCheckbox,
                              margin: getMargin(
                                left: 32,
                                top: 6,
                              ),
                              fontStyle: CheckboxFontStyle.InterRegular14,
                              onChange: (value) {
                                context
                                    .read<InputsBloc>()
                                    .add(ChangeCheckBoxEvent(value: value));
                              },
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
    );
  }
}
