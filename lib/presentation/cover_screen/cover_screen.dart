import 'bloc/cover_bloc.dart';
import 'models/cover_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';

class CoverScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<CoverBloc>(
      create: (context) => CoverBloc(CoverState(
        coverModelObj: CoverModel(),
      ))
        ..add(CoverInitialEvent()),
      child: CoverScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoverBloc, CoverState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorConstant.gray200,
            body: Container(
              width: getHorizontalSize(
                800,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: getVerticalSize(
                      786,
                    ),
                    width: getHorizontalSize(
                      800,
                    ),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgCalendar,
                          height: getVerticalSize(
                            333,
                          ),
                          width: getHorizontalSize(
                            147,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgDrawer,
                          height: getVerticalSize(
                            313,
                          ),
                          width: getHorizontalSize(
                            239,
                          ),
                          alignment: Alignment.topLeft,
                          margin: getMargin(
                            left: 129,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgImages,
                          height: getVerticalSize(
                            294,
                          ),
                          width: getHorizontalSize(
                            239,
                          ),
                          alignment: Alignment.topRight,
                          margin: getMargin(
                            right: 210,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgInsights,
                          height: getVerticalSize(
                            275,
                          ),
                          width: getHorizontalSize(
                            228,
                          ),
                          alignment: Alignment.topRight,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgMarket,
                          height: getVerticalSize(
                            451,
                          ),
                          width: getHorizontalSize(
                            187,
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgRadios,
                          height: getVerticalSize(
                            451,
                          ),
                          width: getHorizontalSize(
                            239,
                          ),
                          alignment: Alignment.bottomLeft,
                          margin: getMargin(
                            left: 169,
                            bottom: 19,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgSignup,
                          height: getVerticalSize(
                            451,
                          ),
                          width: getHorizontalSize(
                            239,
                          ),
                          alignment: Alignment.bottomRight,
                          margin: getMargin(
                            right: 170,
                            bottom: 38,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgSignup451x188,
                          height: getVerticalSize(
                            451,
                          ),
                          width: getHorizontalSize(
                            188,
                          ),
                          alignment: Alignment.bottomRight,
                          margin: getMargin(
                            bottom: 57,
                          ),
                        ),
                      ],
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
