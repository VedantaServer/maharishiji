import '../models/insights_item_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';

// ignore: must_be_immutable
class InsightsItemWidget extends StatelessWidget {
  InsightsItemWidget(this.insightsItemModelObj);

  InsightsItemModel insightsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: getSize(
                  16,
                ),
                width: getSize(
                  16,
                ),
                margin: getMargin(
                  top: 2,
                  bottom: 1,
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
              Padding(
                padding: getPadding(
                  left: 16,
                ),
                child: Text(
                  "lbl_item".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterMedium16Black900,
                ),
              ),
              Spacer(),
              Padding(
                padding: getPadding(
                  top: 1,
                  bottom: 1,
                ),
                child: Text(
                  "lbl_statistic".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterRegular14Black900,
                ),
              ),
            ],
          ),
          Padding(
            padding: getPadding(
              top: 15,
            ),
            child: Divider(
              height: getVerticalSize(
                1,
              ),
              thickness: getVerticalSize(
                1,
              ),
              color: ColorConstant.gray20001,
            ),
          ),
        ],
      ),
    );
  }
}
