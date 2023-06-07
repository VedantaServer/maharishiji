import '../calendar_screen/widgets/listicon1_item_widget.dart';
import '../calendar_screen/widgets/listtwentynine_item_widget.dart';
import 'bloc/calendar_bloc.dart';
import 'models/calendar_model.dart';
import 'models/listicon1_item_model.dart';
import 'models/listtwentynine_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CalendarScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<CalendarBloc>(
      create: (context) => CalendarBloc(CalendarState(
        calendarModelObj: CalendarModel(),
      ))
        ..add(CalendarInitialEvent()),
      child: CalendarScreen(),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        child: Container(
                          padding: getPadding(
                            left: 16,
                            top: 15,
                            right: 16,
                            bottom: 15,
                          ),
                          decoration: AppDecoration.fillGreen400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_march".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterSemiBold30WhiteA700,
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 31,
                                  right: 1,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "lbl_mo".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14WhiteA700,
                                    ),
                                    Text(
                                      "lbl_tu".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14WhiteA700,
                                    ),
                                    Text(
                                      "lbl_we".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14WhiteA700,
                                    ),
                                    Text(
                                      "lbl_th".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14WhiteA700,
                                    ),
                                    Text(
                                      "lbl_fr".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14WhiteA700,
                                    ),
                                    Text(
                                      "lbl_sa".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14WhiteA700,
                                    ),
                                    Text(
                                      "lbl_su".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterRegular14WhiteA700,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 16,
                          top: 32,
                          right: 17,
                        ),
                        child: BlocSelector<CalendarBloc, CalendarState,
                            CalendarModel?>(
                          selector: (state) => state.calendarModelObj,
                          builder: (context, calendarModelObj) {
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (
                                context,
                                index,
                              ) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    39,
                                  ),
                                );
                              },
                              itemCount: calendarModelObj
                                      ?.listtwentynineItemList.length ??
                                  0,
                              itemBuilder: (context, index) {
                                ListtwentynineItemModel model = calendarModelObj
                                        ?.listtwentynineItemList[index] ??
                                    ListtwentynineItemModel();
                                return ListtwentynineItemWidget(
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
                          top: 30,
                          right: 16,
                        ),
                        child: BlocSelector<CalendarBloc, CalendarState,
                            CalendarModel?>(
                          selector: (state) => state.calendarModelObj,
                          builder: (context, calendarModelObj) {
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
                              itemCount:
                                  calendarModelObj?.listicon1ItemList.length ??
                                      0,
                              itemBuilder: (context, index) {
                                Listicon1ItemModel model = calendarModelObj
                                        ?.listicon1ItemList[index] ??
                                    Listicon1ItemModel();
                                return Listicon1ItemWidget(
                                  model,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 78,
                        ),
                        child: Column(
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
                                    child: BlocSelector<CalendarBloc,
                                        CalendarState, TextEditingController?>(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
