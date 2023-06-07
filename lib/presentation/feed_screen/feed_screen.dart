import '../feed_screen/widgets/feed_item_widget.dart';
import 'bloc/feed_bloc.dart';
import 'models/feed_item_model.dart';
import 'models/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class FeedScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<FeedBloc>(
      create: (context) => FeedBloc(FeedState(
        feedModelObj: FeedModel(),
      ))
        ..add(FeedInitialEvent()),
      child: FeedScreen(),
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
            62,
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
                    top: 7,
                    bottom: 9,
                  ),
                ),
                AppbarSubtitle(
                  text: "lbl_feed".tr,
                  margin: getMargin(
                    left: 100,
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
                top: 16,
                right: 16,
                bottom: 19,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 21,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocSelector<FeedBloc, FeedState, TextEditingController?>(
                  selector: (state) => state.searchController,
                  builder: (context, searchController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: searchController,
                      hintText: "lbl_search".tr,
                      margin: getMargin(
                        left: 16,
                        right: 16,
                      ),
                      variant: TextFormFieldVariant.OutlineGray20001,
                      fontStyle: TextFormFieldFontStyle.InterMedium16,
                    );
                  },
                ),
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 15,
                    right: 16,
                  ),
                  child: BlocSelector<FeedBloc, FeedState, FeedModel?>(
                    selector: (state) => state.feedModelObj,
                    builder: (context, feedModelObj) {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return SizedBox(
                            height: getVerticalSize(
                              14,
                            ),
                          );
                        },
                        itemCount: feedModelObj?.feedItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          FeedItemModel model =
                              feedModelObj?.feedItemList[index] ??
                                  FeedItemModel();
                          return FeedItemWidget(
                            model,
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    246,
                  ),
                  width: double.maxFinite,
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: getVerticalSize(
                            227,
                          ),
                          width: getHorizontalSize(
                            343,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.gray20002,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                8,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Divider(
                              height: getVerticalSize(
                                1,
                              ),
                              thickness: getVerticalSize(
                                1,
                              ),
                              color: ColorConstant.blueGray200,
                            ),
                            Container(
                              height: getVerticalSize(
                                83,
                              ),
                              width: double.maxFinite,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: getVerticalSize(
                                        83,
                                      ),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.gray50,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 14,
                                    ),
                                    child: BlocSelector<FeedBloc, FeedState,
                                        TextEditingController?>(
                                      selector: (state) => state.otpController,
                                      builder: (context, otpController) {
                                        return PinCodeTextField(
                                          appContext: context,
                                          controller: otpController,
                                          length: 5,
                                          obscureText: false,
                                          obscuringCharacter: '*',
                                          keyboardType: TextInputType.number,
                                          autoDismissKeyboard: true,
                                          enableActiveFill: true,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          onChanged: (value) {
                                            otpController?.text = value;
                                          },
                                          pinTheme: PinTheme(
                                            fieldHeight: getHorizontalSize(
                                              32,
                                            ),
                                            fieldWidth: getHorizontalSize(
                                              32,
                                            ),
                                            shape: PinCodeFieldShape.circle,
                                            selectedFillColor:
                                                ColorConstant.green400,
                                            activeFillColor:
                                                ColorConstant.green400,
                                            inactiveFillColor:
                                                ColorConstant.green400,
                                            inactiveColor:
                                                ColorConstant.fromHex(
                                                    "#1212121D"),
                                            selectedColor:
                                                ColorConstant.fromHex(
                                                    "#1212121D"),
                                            activeColor: ColorConstant.fromHex(
                                                "#1212121D"),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
