import '../calendar_one_screen/widgets/list1_item_widget.dart';
import '../calendar_one_screen/widgets/listrectangleth1_item_widget.dart';
import 'bloc/calendar_one_bloc.dart';
import 'models/calendar_one_model.dart';
import 'models/list1_item_model.dart';
import 'models/listrectangleth1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:maharishiji/widgets/app_bar/appbar_title.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CalendarOneScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<CalendarOneBloc>(
      create: (context) => CalendarOneBloc(CalendarOneState(
        calendarOneModelObj: CalendarOneModel(),
      ))
        ..add(CalendarOneInitialEvent()),
      child: CalendarOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                child: Container(
                  padding: getPadding(
                    top: 15,
                    bottom: 15,
                  ),
                  decoration: AppDecoration.fillGreen400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        height: getVerticalSize(
                          37,
                        ),
                        title: Padding(
                          padding: getPadding(
                            left: 16,
                          ),
                          child: Row(
                            children: [
                              AppbarSubtitle1(
                                text: "lbl_back".tr,
                                margin: getMargin(
                                  top: 7,
                                  bottom: 9,
                                ),
                              ),
                              AppbarTitle(
                                text: "lbl_market".tr,
                                margin: getMargin(
                                  left: 84,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 16,
                          top: 31,
                          right: 16,
                          bottom: 16,
                        ),
                        padding: getPadding(
                          left: 134,
                          top: 63,
                          right: 134,
                          bottom: 63,
                        ),
                        decoration: AppDecoration.white.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: EdgeInsets.all(0),
                              color: ColorConstant.green60019,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: ColorConstant.green600,
                                  width: getHorizontalSize(
                                    2,
                                  ),
                                ),
                                borderRadius: BorderRadiusStyle.circleBorder37,
                              ),
                              child: Container(
                                height: getSize(
                                  74,
                                ),
                                width: getSize(
                                  74,
                                ),
                                padding: getPadding(
                                  left: 21,
                                  top: 23,
                                  right: 21,
                                  bottom: 23,
                                ),
                                decoration:
                                    AppDecoration.outlineGreen600.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder37,
                                ),
                                child: Stack(
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgPlay,
                                      height: getVerticalSize(
                                        26,
                                      ),
                                      width: getHorizontalSize(
                                        23,
                                      ),
                                      radius: BorderRadius.circular(
                                        getHorizontalSize(
                                          1,
                                        ),
                                      ),
                                      alignment: Alignment.centerRight,
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
              Expanded(
                child: SingleChildScrollView(
                  padding: getPadding(
                    top: 31,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 16,
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
                        child: BlocSelector<CalendarOneBloc, CalendarOneState,
                            CalendarOneModel?>(
                          selector: (state) => state.calendarOneModelObj,
                          builder: (context, calendarOneModelObj) {
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
                              itemCount: calendarOneModelObj
                                      ?.listrectangleth1ItemList.length ??
                                  0,
                              itemBuilder: (context, index) {
                                Listrectangleth1ItemModel model =
                                    calendarOneModelObj
                                            ?.listrectangleth1ItemList[index] ??
                                        Listrectangleth1ItemModel();
                                return Listrectangleth1ItemWidget(
                                  model,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          220,
                        ),
                        width: double.maxFinite,
                        margin: getMargin(
                          top: 33,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "lbl_trending".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterMedium24,
                                  ),
                                  Container(
                                    height: getVerticalSize(
                                      190,
                                    ),
                                    child: BlocSelector<CalendarOneBloc,
                                        CalendarOneState, CalendarOneModel?>(
                                      selector: (state) =>
                                          state.calendarOneModelObj,
                                      builder: (context, calendarOneModelObj) {
                                        return ListView.separated(
                                          padding: getPadding(
                                            top: 13,
                                            right: 129,
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
                                          itemCount: calendarOneModelObj
                                                  ?.list1ItemList.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            List1ItemModel model =
                                                calendarOneModelObj
                                                            ?.list1ItemList[
                                                        index] ??
                                                    List1ItemModel();
                                            return List1ItemWidget(
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
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: getPadding(
                                  bottom: 55,
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
                                            child: BlocSelector<
                                                CalendarOneBloc,
                                                CalendarOneState,
                                                TextEditingController?>(
                                              selector: (state) =>
                                                  state.otpController,
                                              builder:
                                                  (context, otpController) {
                                                return PinCodeTextField(
                                                  appContext: context,
                                                  controller: otpController,
                                                  length: 5,
                                                  obscureText: false,
                                                  obscuringCharacter: '*',
                                                  keyboardType:
                                                      TextInputType.number,
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
                                                    fieldHeight:
                                                        getHorizontalSize(
                                                      32,
                                                    ),
                                                    fieldWidth:
                                                        getHorizontalSize(
                                                      32,
                                                    ),
                                                    shape: PinCodeFieldShape
                                                        .circle,
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
            ],
          ),
        ),
      ),
    );
  }
}
