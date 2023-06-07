import '../profile_posts_two_screen/widgets/scrollcontainer_item_widget.dart';
import 'bloc/profile_posts_two_bloc.dart';
import 'models/profile_posts_two_model.dart';
import 'models/scrollcontainer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:maharishiji/widgets/app_bar/appbar_title.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ProfilePostsTwoScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfilePostsTwoBloc>(
        create: (context) => ProfilePostsTwoBloc(ProfilePostsTwoState(
            profilePostsTwoModelObj: ProfilePostsTwoModel()))
          ..add(ProfilePostsTwoInitialEvent()),
        child: ProfilePostsTwoScreen());
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
                          height: getVerticalSize(242),
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                        padding:
                                            getPadding(top: 15, bottom: 15),
                                        decoration: AppDecoration.fillGreen400,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomAppBar(
                                                  height: getVerticalSize(170),
                                                  title: Padding(
                                                      padding:
                                                          getPadding(left: 16),
                                                      child: Row(children: [
                                                        AppbarSubtitle1(
                                                            text: "lbl_settings"
                                                                .tr,
                                                            margin: getMargin(
                                                                top: 9,
                                                                bottom: 7)),
                                                        AppbarTitle(
                                                            text: "lbl_profile"
                                                                .tr,
                                                            margin: getMargin(
                                                                left: 62))
                                                      ])),
                                                  actions: [
                                                    AppbarSubtitle1(
                                                        text: "lbl_logout".tr,
                                                        margin: getMargin(
                                                            left: 16,
                                                            top: 9,
                                                            right: 16,
                                                            bottom: 7))
                                                  ])
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgEllipse6,
                                    height: getSize(158),
                                    width: getSize(158),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(79)),
                                    alignment: Alignment.bottomCenter)
                              ])),
                      Expanded(
                          child: SingleChildScrollView(
                              padding: getPadding(top: 15),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("msg_victoria_robertson".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterSemiBold30),
                                    Padding(
                                        padding: getPadding(top: 8),
                                        child: Text("msg_a_mantra_goes_here".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtInterSemiBold16Black900)),
                                    Container(
                                        margin: getMargin(
                                            left: 16, top: 22, right: 16),
                                        padding: getPadding(all: 2),
                                        decoration: AppDecoration
                                            .outlineGray200011
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder25),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 64,
                                                      top: 13,
                                                      bottom: 12),
                                                  child: Text("lbl_posts".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterMedium16Gray400)),
                                              Container(
                                                  height: getVerticalSize(46),
                                                  width: getHorizontalSize(171),
                                                  margin: getMargin(left: 59),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                "lbl_search".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtInterMedium16Gray400)),
                                                        CustomButton(
                                                            height:
                                                                getVerticalSize(
                                                                    46),
                                                            width:
                                                                getHorizontalSize(
                                                                    171),
                                                            text:
                                                                "lbl_photos".tr,
                                                            variant:
                                                                ButtonVariant
                                                                    .White,
                                                            fontStyle:
                                                                ButtonFontStyle
                                                                    .InterSemiBold16Green400,
                                                            onTap: () {
                                                              onTapPhotos(
                                                                  context);
                                                            },
                                                            alignment: Alignment
                                                                .center)
                                                      ]))
                                            ])),
                                    Container(
                                        height: getVerticalSize(716),
                                        width: double.maxFinite,
                                        margin: getMargin(top: 16),
                                        child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 16, right: 16),
                                                      child: BlocSelector<
                                                              ProfilePostsTwoBloc,
                                                              ProfilePostsTwoState,
                                                              ProfilePostsTwoModel?>(
                                                          selector: (state) => state
                                                              .profilePostsTwoModelObj,
                                                          builder: (context,
                                                              profilePostsTwoModelObj) {
                                                            return ListView
                                                                .separated(
                                                                    physics:
                                                                        NeverScrollableScrollPhysics(),
                                                                    shrinkWrap:
                                                                        true,
                                                                    separatorBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return SizedBox(
                                                                          height:
                                                                              getVerticalSize(16));
                                                                    },
                                                                    itemCount: profilePostsTwoModelObj
                                                                            ?.scrollcontainerItemList
                                                                            .length ??
                                                                        0,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      ScrollcontainerItemModel
                                                                          model =
                                                                          profilePostsTwoModelObj?.scrollcontainerItemList[index] ??
                                                                              ScrollcontainerItemModel();
                                                                      return ScrollcontainerItemWidget(
                                                                          model);
                                                                    });
                                                          }))),
                                              Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                      padding:
                                                          getPadding(top: 274),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: ColorConstant
                                                                    .blueGray200),
                                                            Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        83),
                                                                width: double
                                                                    .maxFinite,
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .topCenter,
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .center,
                                                                          child: Container(
                                                                              height: getVerticalSize(83),
                                                                              width: double.maxFinite,
                                                                              decoration: BoxDecoration(color: ColorConstant.gray50))),
                                                                      Padding(
                                                                          padding:
                                                                              getPadding(top: 14),
                                                                          child: BlocSelector<ProfilePostsTwoBloc, ProfilePostsTwoState, TextEditingController?>(
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
                                                                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                                                    onChanged: (value) {
                                                                                      otpController?.text = value;
                                                                                    },
                                                                                    pinTheme: PinTheme(fieldHeight: getHorizontalSize(32), fieldWidth: getHorizontalSize(32), shape: PinCodeFieldShape.circle, selectedFillColor: ColorConstant.green400, activeFillColor: ColorConstant.green400, inactiveFillColor: ColorConstant.green400, inactiveColor: ColorConstant.fromHex("#1212121D"), selectedColor: ColorConstant.fromHex("#1212121D"), activeColor: ColorConstant.fromHex("#1212121D")));
                                                                              }))
                                                                    ]))
                                                          ])))
                                            ]))
                                  ])))
                    ]))));
  }

  onTapPhotos(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profilePostsOneScreen,
    );
  }
}
