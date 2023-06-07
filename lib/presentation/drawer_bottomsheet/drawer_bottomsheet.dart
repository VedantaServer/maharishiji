import 'bloc/drawer_bloc.dart';
import 'models/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class DrawerBottomsheet extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<DrawerBloc>(
      create: (context) => DrawerBloc(DrawerState(
        drawerModelObj: DrawerModel(),
      ))
        ..add(DrawerInitialEvent()),
      child: DrawerBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        child: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 24,
            top: 16,
            right: 24,
            bottom: 16,
          ),
          decoration: AppDecoration.white.copyWith(
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
    );
  }
}
