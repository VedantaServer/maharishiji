import 'bloc/images_bloc.dart';
import 'models/images_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ImagesScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ImagesBloc>(
        create: (context) =>
            ImagesBloc(ImagesState(imagesModelObj: ImagesModel()))
              ..add(ImagesInitialEvent()),
        child: ImagesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(65),
                title: Padding(
                    padding: getPadding(left: 16),
                    child: Row(children: [
                      AppbarSubtitle2(
                          text: "lbl_back".tr,
                          margin: getMargin(top: 4, bottom: 12)),
                      AppbarSubtitle(
                          text: "lbl_images".tr, margin: getMargin(left: 82))
                    ])),
                actions: [
                  AppbarSubtitle2(
                      text: "lbl_next".tr,
                      margin:
                          getMargin(left: 16, top: 13, right: 16, bottom: 22))
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgImageblocks,
                              height: getVerticalSize(589),
                              width: getHorizontalSize(343)),
                          Padding(
                              padding: getPadding(top: 14),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Divider(
                                        height: getVerticalSize(1),
                                        thickness: getVerticalSize(1),
                                        color: ColorConstant.blueGray200),
                                    Container(
                                        height: getVerticalSize(83),
                                        width: double.maxFinite,
                                        child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                      height:
                                                          getVerticalSize(83),
                                                      width: double.maxFinite,
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray50))),
                                              Padding(
                                                  padding: getPadding(top: 14),
                                                  child: BlocSelector<
                                                          ImagesBloc,
                                                          ImagesState,
                                                          TextEditingController?>(
                                                      selector: (state) =>
                                                          state.otpController,
                                                      builder: (context,
                                                          otpController) {
                                                        return PinCodeTextField(
                                                            appContext: context,
                                                            controller:
                                                                otpController,
                                                            length: 5,
                                                            obscureText: false,
                                                            obscuringCharacter:
                                                                '*',
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            autoDismissKeyboard:
                                                                true,
                                                            enableActiveFill:
                                                                true,
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly
                                                            ],
                                                            onChanged: (value) {
                                                              otpController
                                                                      ?.text =
                                                                  value;
                                                            },
                                                            pinTheme: PinTheme(
                                                                fieldHeight:
                                                                    getHorizontalSize(
                                                                        32),
                                                                fieldWidth:
                                                                    getHorizontalSize(
                                                                        32),
                                                                shape:
                                                                    PinCodeFieldShape
                                                                        .circle,
                                                                selectedFillColor:
                                                                    ColorConstant
                                                                        .green400,
                                                                activeFillColor:
                                                                    ColorConstant
                                                                        .green400,
                                                                inactiveFillColor:
                                                                    ColorConstant
                                                                        .green400,
                                                                inactiveColor:
                                                                    ColorConstant
                                                                        .fromHex(
                                                                            "#1212121D"),
                                                                selectedColor:
                                                                    ColorConstant
                                                                        .fromHex(
                                                                            "#1212121D"),
                                                                activeColor:
                                                                    ColorConstant
                                                                        .fromHex(
                                                                            "#1212121D")));
                                                      }))
                                            ]))
                                  ]))
                        ])))));
  }
}
