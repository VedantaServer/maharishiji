import 'bloc/market_one_bloc.dart';
import 'models/market_one_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';

class MarketOneScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<MarketOneBloc>(
      create: (context) => MarketOneBloc(MarketOneState(
        marketOneModelObj: MarketOneModel(),
      ))
        ..add(MarketOneInitialEvent()),
      child: MarketOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(
            56,
          ),
          title: Padding(
            padding: getPadding(
              left: 16,
            ),
            child: Row(
              children: [
                AppbarSubtitle2(
                  text: "lbl_back".tr,
                  margin: getMargin(
                    top: 4,
                    bottom: 12,
                  ),
                ),
                AppbarSubtitle(
                  text: "lbl_messages".tr,
                  margin: getMargin(
                    left: 61,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            AppbarSubtitle2(
              text: "lbl_filter".tr,
              margin: getMargin(
                left: 16,
                top: 13,
                right: 16,
                bottom: 22,
              ),
            ),
          ],
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 16,
            top: 18,
            right: 16,
            bottom: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: getHorizontalSize(
                  235,
                ),
                padding: getPadding(
                  left: 16,
                  top: 15,
                  right: 16,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: fs.Svg(
                      ImageConstant.imgMessagereceive,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        183,
                      ),
                      margin: getMargin(
                        bottom: 27,
                      ),
                      child: Text(
                        "msg_lorem_ipsum_dolor".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular14Black900,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: getHorizontalSize(
                    235,
                  ),
                  margin: getMargin(
                    top: 16,
                    right: 3,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 15,
                    right: 16,
                    bottom: 15,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: fs.Svg(
                        ImageConstant.imgMessagesend,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: getHorizontalSize(
                          183,
                        ),
                        margin: getMargin(
                          bottom: 18,
                        ),
                        child: Text(
                          "msg_lorem_ipsum_dolor2".tr,
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14WhiteA700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: getHorizontalSize(
                    235,
                  ),
                  margin: getMargin(
                    top: 16,
                    right: 2,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 15,
                    right: 16,
                    bottom: 15,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: fs.Svg(
                        ImageConstant.imgMessagesend,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: getHorizontalSize(
                          183,
                        ),
                        margin: getMargin(
                          bottom: 18,
                        ),
                        child: Text(
                          "msg_lorem_ipsum_dolor2".tr,
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular14WhiteA700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  235,
                ),
                margin: getMargin(
                  top: 16,
                  bottom: 5,
                ),
                padding: getPadding(
                  left: 16,
                  top: 15,
                  right: 16,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: fs.Svg(
                      ImageConstant.imgMessagereceive,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        183,
                      ),
                      margin: getMargin(
                        bottom: 27,
                      ),
                      child: Text(
                        "msg_lorem_ipsum_dolor".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular14Black900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            BlocSelector<MarketOneBloc, MarketOneState, TextEditingController?>(
          selector: (state) => state.messageController,
          builder: (context, messageController) {
            return CustomTextFormField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: messageController,
              hintText: "lbl_message_here".tr,
              margin: getMargin(
                left: 14,
                right: 18,
                bottom: 16,
              ),
              variant: TextFormFieldVariant.OutlineGray20001_1,
              padding: TextFormFieldPadding.PaddingT15,
              fontStyle: TextFormFieldFontStyle.InterMedium16,
              textInputAction: TextInputAction.done,
              suffix: Container(
                padding: getPadding(
                  left: 12,
                  top: 10,
                  right: 12,
                  bottom: 10,
                ),
                margin: getMargin(
                  left: 30,
                  top: 8,
                  right: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.green400,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      17,
                    ),
                  ),
                ),
                child: CustomImageView(
                  svgPath: ImageConstant.imgArrowup,
                ),
              ),
              suffixConstraints: BoxConstraints(
                maxHeight: getVerticalSize(
                  50,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
