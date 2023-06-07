import 'bloc/inputs_one_bloc.dart';
import 'models/inputs_one_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/custom_button.dart';

class InputsOneScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<InputsOneBloc>(
      create: (context) => InputsOneBloc(InputsOneState(
        inputsOneModelObj: InputsOneModel(),
      ))
        ..add(InputsOneInitialEvent()),
      child: InputsOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputsOneBloc, InputsOneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
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
                          bottom: 590,
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
                                        "lbl_button".tr,
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
                                "lbl_button_primary".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular12,
                              ),
                            ),
                            CustomButton(
                              height: getVerticalSize(
                                51,
                              ),
                              width: getHorizontalSize(
                                131,
                              ),
                              text: "lbl_click_me".tr,
                              margin: getMargin(
                                left: 32,
                                top: 6,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 32,
                                top: 17,
                              ),
                              child: Text(
                                "msg_button_secondary".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular12,
                              ),
                            ),
                            CustomButton(
                              height: getVerticalSize(
                                51,
                              ),
                              width: getHorizontalSize(
                                131,
                              ),
                              text: "lbl_click_me".tr,
                              margin: getMargin(
                                left: 32,
                                top: 6,
                              ),
                              variant: ButtonVariant.FillGray100,
                              fontStyle:
                                  ButtonFontStyle.InterSemiBold16Green600,
                            ),
                            Padding(
                              padding: getPadding(
                                left: 32,
                                top: 16,
                              ),
                              child: Text(
                                "lbl_button_disabled".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular12,
                              ),
                            ),
                            CustomButton(
                              height: getVerticalSize(
                                51,
                              ),
                              width: getHorizontalSize(
                                131,
                              ),
                              text: "lbl_click_me".tr,
                              margin: getMargin(
                                left: 32,
                                top: 7,
                              ),
                              variant: ButtonVariant.FillGray100,
                              fontStyle: ButtonFontStyle.InterSemiBold16Gray400,
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
      },
    );
  }
}
