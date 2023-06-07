import 'bloc/rating_bloc.dart';
import 'models/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/custom_button.dart';

class RatingScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<RatingBloc>(
      create: (context) => RatingBloc(RatingState(
        ratingModelObj: RatingModel(),
      ))
        ..add(RatingInitialEvent()),
      child: RatingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
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
                              top: 1,
                            ),
                            child: RatingBar.builder(
                              initialRating: 5,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemSize: getVerticalSize(
                                32,
                              ),
                              itemCount: 5,
                              updateOnDrag: true,
                              onRatingUpdate: (rating) {},
                              itemBuilder: (
                                context,
                                _,
                              ) {
                                return Icon(
                                  Icons.star,
                                  color: ColorConstant.orange300,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 34,
                            ),
                            child: Text(
                              "lbl_rate_our_app".tr,
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
                            text: "lbl_i_love_it".tr,
                            margin: getMargin(
                              top: 41,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 18,
                            ),
                            child: Text(
                              "msg_don_t_like_the_app".tr,
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
