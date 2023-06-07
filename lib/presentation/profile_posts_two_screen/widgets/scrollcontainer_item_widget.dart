import '../models/scrollcontainer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ScrollcontainerItemWidget extends StatelessWidget {
  ScrollcontainerItemWidget(this.scrollcontainerItemModelObj);

  ScrollcontainerItemModel scrollcontainerItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: getVerticalSize(
                240,
              ),
              width: getHorizontalSize(
                343,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.gray100,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    8,
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 7,
              ),
              child: Text(
                "lbl_header".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterSemiBold16Black900,
              ),
            ),
            Container(
              width: getHorizontalSize(
                325,
              ),
              margin: getMargin(
                top: 7,
                right: 17,
              ),
              child: Text(
                "msg_he_ll_want_to_use".tr,
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterRegular14Black900,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 6,
              ),
              child: Text(
                "lbl_8m_ago".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterRegular14Gray400,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: getVerticalSize(
                  8,
                ),
                margin: getMargin(
                  top: 6,
                ),
                child: SmoothIndicator(
                  offset: 0,
                  count: 3,
                  size: Size.zero,
                  effect: ScrollingDotsEffect(
                    spacing: 8,
                    activeDotColor: ColorConstant.green400,
                    dotColor: ColorConstant.gray20001,
                    dotHeight: getVerticalSize(
                      8,
                    ),
                    dotWidth: getHorizontalSize(
                      8,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
