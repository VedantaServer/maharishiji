import '../models/listrectangleth_item_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';

// ignore: must_be_immutable
class ListrectanglethItemWidget extends StatelessWidget {
  ListrectanglethItemWidget(this.listrectanglethItemModelObj);

  ListrectanglethItemModel listrectanglethItemModelObj;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: getSize(
                110,
              ),
              width: getSize(
                110,
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
            Container(
              width: getHorizontalSize(
                91,
              ),
              margin: getMargin(
                top: 8,
              ),
              child: Text(
                "msg_item_1_name_goes".tr,
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterRegular14Black900,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 7,
              ),
              child: Text(
                "lbl_19_99".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterSemiBold14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
