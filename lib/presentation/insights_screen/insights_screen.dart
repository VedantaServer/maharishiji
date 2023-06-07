import '../insights_screen/widgets/insights_item_widget.dart';
import 'bloc/insights_bloc.dart';
import 'models/insights_item_model.dart';
import 'models/insights_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class InsightsScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<InsightsBloc>(
      create: (context) => InsightsBloc(InsightsState(
        insightsModelObj: InsightsModel(),
      ))
        ..add(InsightsInitialEvent()),
      child: InsightsScreen(),
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
                    top: 4,
                    bottom: 12,
                  ),
                ),
                AppbarSubtitle(
                  text: "lbl_insights".tr,
                  margin: getMargin(
                    left: 77,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 19,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: getSize(
                    196,
                  ),
                  width: getSize(
                    196,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: getSize(
                            196,
                          ),
                          width: getSize(
                            196,
                          ),
                          child: CircularProgressIndicator(
                            value: 0.5,
                            strokeWidth: getHorizontalSize(
                              3,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: getPadding(
                            left: 58,
                            right: 60,
                            bottom: 65,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_32_01".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterMedium24Green400,
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 8,
                                ),
                                child: Text(
                                  "lbl_70_spent".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterRegular10Gray400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 16,
                      top: 33,
                    ),
                    child: Text(
                      "lbl_expenses".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterMedium24,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 28,
                    right: 16,
                  ),
                  child:
                      BlocSelector<InsightsBloc, InsightsState, InsightsModel?>(
                    selector: (state) => state.insightsModelObj,
                    builder: (context, insightsModelObj) {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return SizedBox(
                            height: getVerticalSize(
                              14,
                            ),
                          );
                        },
                        itemCount:
                            insightsModelObj?.insightsItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          InsightsItemModel model =
                              insightsModelObj?.insightsItemList[index] ??
                                  InsightsItemModel();
                          return InsightsItemWidget(
                            model,
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 21,
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
                              child: BlocSelector<InsightsBloc, InsightsState,
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
