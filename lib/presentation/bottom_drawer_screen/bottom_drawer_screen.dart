import 'bloc/bottom_drawer_bloc.dart';
import 'models/bottom_drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/custom_button.dart';

class BottomDrawerScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<BottomDrawerBloc>(
      create: (context) => BottomDrawerBloc(BottomDrawerState(
        bottomDrawerModelObj: BottomDrawerModel(),
      ))
        ..add(BottomDrawerInitialEvent()),
      child: BottomDrawerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomDrawerBloc, BottomDrawerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Container(
                      padding: getPadding(
                        left: 24,
                        top: 16,
                        right: 24,
                        bottom: 16,
                      ),
                      decoration: AppDecoration.outlineBlack9003f.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgHeaderelements,
                            height: getVerticalSize(
                              4,
                            ),
                            width: getHorizontalSize(
                              32,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 31,
                            ),
                            child: Text(
                              "lbl_drawer_header".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterMedium24,
                            ),
                          ),
                          Container(
                            width: getHorizontalSize(
                              295,
                            ),
                            margin: getMargin(
                              left: 15,
                              top: 14,
                              right: 15,
                            ),
                            child: Text(
                              "msg_consequat_velit4".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtInterMedium16Gray700,
                            ),
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              51,
                            ),
                            text: "lbl_click_me".tr,
                            margin: getMargin(
                              top: 15,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 16,
                              bottom: 21,
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
