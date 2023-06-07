import 'bloc/images_one_bloc.dart';
import 'models/images_one_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ImagesOneScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ImagesOneBloc>(
      create: (context) => ImagesOneBloc(ImagesOneState(
        imagesOneModelObj: ImagesOneModel(),
      ))
        ..add(ImagesOneInitialEvent()),
      child: ImagesOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      height: getVerticalSize(
                        55,
                      ),
                      title: Padding(
                        padding: getPadding(
                          left: 16,
                        ),
                        child: Row(
                          children: [
                            AppbarSubtitle2(
                              text: "lbl_back".tr,
                              margin: getMargin(
                                top: 4,
                                bottom: 12,
                              ),
                            ),
                            AppbarSubtitle(
                              text: "lbl_images".tr,
                              margin: getMargin(
                                left: 82,
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        AppbarSubtitle2(
                          text: "lbl_next".tr,
                          margin: getMargin(
                            left: 16,
                            top: 4,
                            right: 16,
                            bottom: 12,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: getPadding(
                          top: 629,
                        ),
                        child: Padding(
                          padding: getPadding(
                            bottom: 94,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Divider(
                                height: getVerticalSize(
                                  1,
                                ),
                                thickness: getVerticalSize(
                                  1,
                                ),
                                color: ColorConstant.blueGray200,
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
                                          ImagesOneBloc,
                                          ImagesOneState,
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
                                            keyboardType: TextInputType.number,
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
                    ),
                  ],
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgImageblocksGray100,
                height: getVerticalSize(
                  844,
                ),
                width: getHorizontalSize(
                  343,
                ),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
