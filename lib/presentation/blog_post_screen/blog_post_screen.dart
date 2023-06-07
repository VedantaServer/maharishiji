import 'bloc/blog_post_bloc.dart';
import 'models/blog_post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class BlogPostScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<BlogPostBloc>(
      create: (context) => BlogPostBloc(BlogPostState(
        blogPostModelObj: BlogPostModel(),
      ))
        ..add(BlogPostInitialEvent()),
      child: BlogPostScreen(),
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
                  padding: getPadding(
                    top: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: getVerticalSize(
                          196,
                        ),
                        width: getHorizontalSize(
                          343,
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
                        height: getVerticalSize(
                          512,
                        ),
                        width: double.maxFinite,
                        margin: getMargin(
                          top: 31,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: getPadding(
                                  left: 16,
                                  right: 16,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "msg_post_title_here".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium24,
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 7,
                                      ),
                                      child: Text(
                                        "lbl_author".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtInterSemiBold16Black900,
                                      ),
                                    ),
                                    Container(
                                      width: getHorizontalSize(
                                        343,
                                      ),
                                      margin: getMargin(
                                        top: 14,
                                      ),
                                      child: Text(
                                        "msg_labore_sunt_veniam".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterMedium16Gray700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: getPadding(
                                  bottom: 3,
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
                                                BlogPostBloc,
                                                BlogPostState,
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
