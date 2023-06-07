import 'bloc/ios_status_bar_bloc.dart';
import 'models/ios_status_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';

class IosStatusBarScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<IosStatusBarBloc>(
      create: (context) => IosStatusBarBloc(IosStatusBarState(
        iosStatusBarModelObj: IosStatusBarModel(),
      ))
        ..add(IosStatusBarInitialEvent()),
      child: IosStatusBarScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IosStatusBarBloc, IosStatusBarState>(
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
                          bottom: 694,
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
                                        "lbl_ios".tr,
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
                                        "lbl_ios_status_bar".tr,
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
                            CustomImageView(
                              svgPath: ImageConstant.imgIosstatusbarblack,
                              height: getVerticalSize(
                                44,
                              ),
                              width: getHorizontalSize(
                                375,
                              ),
                              alignment: Alignment.center,
                              margin: getMargin(
                                top: 7,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 32,
                                top: 16,
                              ),
                              child: Text(
                                "msg_ios_status_bar_white".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular12,
                              ),
                            ),
                            CustomImageView(
                              svgPath:
                                  ImageConstant.imgIosstatusbarblackBlack900,
                              height: getVerticalSize(
                                44,
                              ),
                              width: getHorizontalSize(
                                375,
                              ),
                              alignment: Alignment.center,
                              margin: getMargin(
                                top: 7,
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
      },
    );
  }
}
