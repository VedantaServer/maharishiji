import 'bloc/radios_bloc.dart';
import 'models/radios_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_button.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RadiosScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<RadiosBloc>(
      create: (context) => RadiosBloc(RadiosState(
        radiosModelObj: RadiosModel(),
      ))
        ..add(RadiosInitialEvent()),
      child: RadiosScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(
            64,
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
                    top: 5,
                    bottom: 11,
                  ),
                ),
                AppbarSubtitle(
                  text: "lbl_user_options".tr,
                  margin: getMargin(
                    left: 40,
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
                top: 14,
                right: 16,
                bottom: 21,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 34,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocSelector<RadiosBloc, RadiosState, TextEditingController?>(
                  selector: (state) => state.radioselectedController,
                  builder: (context, radioselectedController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: radioselectedController,
                      hintText: "msg_radio_option_here".tr,
                      margin: getMargin(
                        left: 16,
                        right: 16,
                      ),
                    );
                  },
                ),
                Container(
                  height: getVerticalSize(
                    34,
                  ),
                  width: getHorizontalSize(
                    343,
                  ),
                  margin: getMargin(
                    top: 14,
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      BlocSelector<RadiosBloc, RadiosState,
                          TextEditingController?>(
                        selector: (state) => state.grouptwentyseveController,
                        builder: (context, grouptwentyseveController) {
                          return CustomTextFormField(
                            width: getHorizontalSize(
                              343,
                            ),
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: grouptwentyseveController,
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
                BlocSelector<RadiosBloc, RadiosState, TextEditingController?>(
                  selector: (state) => state.radioselectedController1,
                  builder: (context, radioselectedController1) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: radioselectedController1,
                      hintText: "msg_radio_option_here".tr,
                      margin: getMargin(
                        left: 16,
                        top: 13,
                        right: 16,
                      ),
                    );
                  },
                ),
                Container(
                  height: getVerticalSize(
                    34,
                  ),
                  width: getHorizontalSize(
                    343,
                  ),
                  margin: getMargin(
                    top: 14,
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      BlocSelector<RadiosBloc, RadiosState,
                          TextEditingController?>(
                        selector: (state) => state.groupthirtyoneController,
                        builder: (context, groupthirtyoneController) {
                          return CustomTextFormField(
                            width: getHorizontalSize(
                              343,
                            ),
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: groupthirtyoneController,
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
                Container(
                  height: getVerticalSize(
                    34,
                  ),
                  width: getHorizontalSize(
                    343,
                  ),
                  margin: getMargin(
                    top: 14,
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      BlocSelector<RadiosBloc, RadiosState,
                          TextEditingController?>(
                        selector: (state) => state.groupthirtythreController,
                        builder: (context, groupthirtythreController) {
                          return CustomTextFormField(
                            width: getHorizontalSize(
                              343,
                            ),
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: groupthirtythreController,
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
                BlocSelector<RadiosBloc, RadiosState, TextEditingController?>(
                  selector: (state) => state.radioselectedController2,
                  builder: (context, radioselectedController2) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: radioselectedController2,
                      hintText: "msg_radio_option_here".tr,
                      margin: getMargin(
                        left: 16,
                        top: 13,
                        right: 16,
                      ),
                    );
                  },
                ),
                CustomButton(
                  height: getVerticalSize(
                    51,
                  ),
                  text: "lbl_i_love_it".tr,
                  margin: getMargin(
                    left: 16,
                    top: 244,
                    right: 16,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 16,
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
                              child: BlocSelector<RadiosBloc, RadiosState,
                                  TextEditingController?>(
                                selector: (state) => state.otpController,
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
                                      FilteringTextInputFormatter.digitsOnly,
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
                                      selectedFillColor: ColorConstant.green400,
                                      activeFillColor: ColorConstant.green400,
                                      inactiveFillColor: ColorConstant.green400,
                                      inactiveColor:
                                          ColorConstant.fromHex("#1212121D"),
                                      selectedColor:
                                          ColorConstant.fromHex("#1212121D"),
                                      activeColor:
                                          ColorConstant.fromHex("#1212121D"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
