import 'bloc/congratulations_bloc.dart';
import 'models/congratulations_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/custom_button.dart';

class CongratulationsScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<CongratulationsBloc>(
      create: (context) => CongratulationsBloc(CongratulationsState(
        congratulationsModelObj: CongratulationsModel(),
      ))
        ..add(CongratulationsInitialEvent()),
      child: CongratulationsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CongratulationsBloc, CongratulationsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorConstant.green400,
            body: Container(
              width: double.maxFinite,
              padding: getPadding(
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Container(
                      margin: getMargin(
                        bottom: 5,
                      ),
                      padding: getPadding(
                        left: 16,
                        top: 30,
                        right: 16,
                        bottom: 30,
                      ),
                      decoration: AppDecoration.outlineIndigo9003f.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: getPadding(
                              top: 3,
                            ),
                            child: Text(
                              "msg_congratulations".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold30,
                            ),
                          ),
                          Container(
                            width: getHorizontalSize(
                              295,
                            ),
                            margin: getMargin(
                              left: 7,
                              top: 11,
                              right: 7,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "msg_consequat_velit2".tr,
                                    style: TextStyle(
                                      color: ColorConstant.gray700,
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "msg_consequat_velit3".tr,
                                    style: TextStyle(
                                      color: ColorConstant.gray700,
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              51,
                            ),
                            text: "lbl_click_me".tr,
                            margin: getMargin(
                              top: 41,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 18,
                            ),
                            child: Text(
                              "msg_secondary_action".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold16,
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
        );
      },
    );
  }
}
