import 'bloc/ios_navigation_bloc.dart';
import 'models/ios_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class IosNavigationScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<IosNavigationBloc>(
      create: (context) => IosNavigationBloc(IosNavigationState(
        iosNavigationModelObj: IosNavigationModel(),
      ))
        ..add(IosNavigationInitialEvent()),
      child: IosNavigationScreen(),
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
                      bottom: 662,
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
                                    "lbl_ios".tr,
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
                                    "lbl_ios_navigation".tr,
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
                            "msg_ios_status_bar_black".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular12,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 30,
                            top: 9,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 6,
                                  bottom: 10,
                                ),
                                child: Text(
                                  "lbl_right".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium16,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 34,
                                ),
                                child: Text(
                                  "lbl_sign_up".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold30,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 40,
                                  top: 4,
                                  bottom: 12,
                                ),
                                child: Text(
                                  "lbl_left".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 27,
                            top: 13,
                          ),
                          child: Text(
                            "msg_ios_bottom_bar_5".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular12,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 27,
                              top: 7,
                              right: 27,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getVerticalSize(
                                    1,
                                  ),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.blueGray200,
                                  ),
                                ),
                                Container(
                                  height: getVerticalSize(
                                    83,
                                  ),
                                  width: double.maxFinite,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: getVerticalSize(
                                            83,
                                          ),
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            color: ColorConstant.gray50,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 14,
                                        ),
                                        child: BlocSelector<
                                            IosNavigationBloc,
                                            IosNavigationState,
                                            TextEditingController?>(
                                          selector: (state) =>
                                              state.otpController,
                                          builder: (context, otpController) {
                                            return PinCodeTextField(
                                              appContext: context,
                                              controller: otpController,
                                              length: 5,
                                              obscureText: false,
                                              obscuringCharacter: '*',
                                              keyboardType:
                                                  TextInputType.number,
                                              autoDismissKeyboard: true,
                                              enableActiveFill: true,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              onChanged: (value) {
                                                otpController?.text = value;
                                              },
                                              pinTheme: PinTheme(
                                                fieldHeight: getHorizontalSize(
                                                  32,
                                                ),
                                                fieldWidth: getHorizontalSize(
                                                  32,
                                                ),
                                                shape: PinCodeFieldShape.circle,
                                                selectedFillColor:
                                                    ColorConstant.green400,
                                                activeFillColor:
                                                    ColorConstant.green400,
                                                inactiveFillColor:
                                                    ColorConstant.green400,
                                                inactiveColor:
                                                    ColorConstant.fromHex(
                                                        "#1212121D"),
                                                selectedColor:
                                                    ColorConstant.fromHex(
                                                        "#1212121D"),
                                                activeColor:
                                                    ColorConstant.fromHex(
                                                        "#1212121D"),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
