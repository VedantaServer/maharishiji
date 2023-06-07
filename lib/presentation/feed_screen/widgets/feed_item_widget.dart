import '../models/feed_item_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';

// ignore: must_be_immutable
class FeedItemWidget extends StatelessWidget {
  FeedItemWidget(this.feedItemModelObj);

  FeedItemModel feedItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getSize(
                  50,
                ),
                width: getSize(
                  50,
                ),
                margin: getMargin(
                  bottom: 14,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: getPadding(
                          bottom: 1,
                        ),
                        child: Text(
                          "lbl_header".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterSemiBold16Black900,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 170,
                          top: 4,
                        ),
                        child: Text(
                          "lbl_8m_ago".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14Gray400,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: getHorizontalSize(
                      261,
                    ),
                    margin: getMargin(
                      top: 6,
                      right: 15,
                    ),
                    child: Text(
                      "msg_he_ll_want_to_use".tr,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular14Black900,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: getPadding(
              top: 12,
            ),
            child: Divider(
              height: getVerticalSize(
                1,
              ),
              thickness: getVerticalSize(
                1,
              ),
              color: ColorConstant.gray20001,
              indent: getHorizontalSize(
                66,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
