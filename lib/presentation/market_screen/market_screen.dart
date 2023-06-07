import '../market_screen/widgets/list_item_widget.dart';
import '../market_screen/widgets/list_one_item_widget.dart';
import '../market_screen/widgets/listrectangleth_item_widget.dart';
import 'bloc/market_bloc.dart';
import 'models/list_item_model.dart';
import 'models/list_one_item_model.dart';
import 'models/listrectangleth_item_model.dart';
import 'models/market_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MarketScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<MarketBloc>(
      create: (context) => MarketBloc(MarketState(
        marketModelObj: MarketModel(),
      ))
        ..add(MarketInitialEvent()),
      child: MarketScreen(),
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
                  text: "lbl_market".tr,
                  margin: getMargin(
                    left: 84,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocSelector<MarketBloc, MarketState, TextEditingController?>(
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
                      alignment: Alignment.center,
                    );
                  },
                ),
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 31,
                  ),
                  child: Text(
                    "lbl_hot_deals".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterMedium24,
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    192,
                  ),
                  child: BlocSelector<MarketBloc, MarketState, MarketModel?>(
                    selector: (state) => state.marketModelObj,
                    builder: (context, marketModelObj) {
                      return ListView.separated(
                        padding: getPadding(
                          left: 16,
                          top: 15,
                        ),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return SizedBox(
                            height: getVerticalSize(
                              16,
                            ),
                          );
                        },
                        itemCount:
                            marketModelObj?.listrectanglethItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          ListrectanglethItemModel model =
                              marketModelObj?.listrectanglethItemList[index] ??
                                  ListrectanglethItemModel();
                          return ListrectanglethItemWidget(
                            model,
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 33,
                  ),
                  child: Text(
                    "lbl_trending".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterMedium24,
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    190,
                  ),
                  child: BlocSelector<MarketBloc, MarketState, MarketModel?>(
                    selector: (state) => state.marketModelObj,
                    builder: (context, marketModelObj) {
                      return ListView.separated(
                        padding: getPadding(
                          left: 16,
                          top: 13,
                        ),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return SizedBox(
                            height: getVerticalSize(
                              16,
                            ),
                          );
                        },
                        itemCount: marketModelObj?.listItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          ListItemModel model =
                              marketModelObj?.listItemList[index] ??
                                  ListItemModel();
                          return ListItemWidget(
                            model,
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    222,
                  ),
                  width: double.maxFinite,
                  margin: getMargin(
                    top: 31,
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_deals".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterMedium24,
                            ),
                            Container(
                              height: getVerticalSize(
                                192,
                              ),
                              child: BlocSelector<MarketBloc, MarketState,
                                  MarketModel?>(
                                selector: (state) => state.marketModelObj,
                                builder: (context, marketModelObj) {
                                  return ListView.separated(
                                    padding: getPadding(
                                      top: 15,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (
                                      context,
                                      index,
                                    ) {
                                      return SizedBox(
                                        height: getVerticalSize(
                                          16,
                                        ),
                                      );
                                    },
                                    itemCount: marketModelObj
                                            ?.listOneItemList.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      ListOneItemModel model = marketModelObj
                                              ?.listOneItemList[index] ??
                                          ListOneItemModel();
                                      return ListOneItemWidget(
                                        model,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: getPadding(
                            top: 11,
                          ),
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
                                      child: BlocSelector<MarketBloc,
                                          MarketState, TextEditingController?>(
                                        selector: (state) =>
                                            state.otpController,
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
                                              activeColor:
                                                  ColorConstant.fromHex(
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
