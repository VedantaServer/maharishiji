import '../models/bars_item_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';

// ignore: must_be_immutable
class BarsItemWidget extends StatelessWidget {
  BarsItemWidget(this.barsItemModelObj);

  BarsItemModel barsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 19,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: getVerticalSize(
                  166,
                ),
                width: getHorizontalSize(
                  16,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgBackground,
                      height: getVerticalSize(
                        159,
                      ),
                      width: getHorizontalSize(
                        16,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          8,
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: getVerticalSize(
                          117,
                        ),
                        width: getHorizontalSize(
                          16,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.green400,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "lbl_item".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular10,
            ),
          ],
        ),
      ),
    );
  }
}
