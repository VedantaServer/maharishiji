import '../models/listtwentynine_item_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';

// ignore: must_be_immutable
class ListtwentynineItemWidget extends StatelessWidget {
  ListtwentynineItemWidget(this.listtwentynineItemModelObj);

  ListtwentynineItemModel listtwentynineItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          listtwentynineItemModelObj.twentynineTxt,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtInterRegular14Gray400,
        ),
        Text(
          listtwentynineItemModelObj.thirtyTxt,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtInterRegular14Gray400,
        ),
        Text(
          listtwentynineItemModelObj.thirtyoneTxt,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtInterRegular14Gray400,
        ),
        Text(
          listtwentynineItemModelObj.oneTxt,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtInterRegular14Black900,
        ),
        Text(
          listtwentynineItemModelObj.twoTxt,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtInterRegular14Black900,
        ),
        Text(
          listtwentynineItemModelObj.threeTxt,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtInterRegular14Black900,
        ),
        Text(
          listtwentynineItemModelObj.fourTxt,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtInterRegular14Black900,
        ),
      ],
    );
  }
}
