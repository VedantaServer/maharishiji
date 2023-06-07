import 'bloc/sign_up_bloc.dart';
import 'models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/core/utils/validation_functions.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_button.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) =>
            SignUpBloc(SignUpState(signUpModelObj: SignUpModel()))
              ..add(SignUpInitialEvent()),
        child: SignUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(64),
                leadingWidth: 37,
                leading: CustomImageView(
                    svgPath: ImageConstant.imgClose,
                    height: getSize(22),
                    width: getSize(22),
                    margin: getMargin(left: 15, top: 11, bottom: 22),
                    onTap: () {
                      onTapImgClose(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_sign_up".tr),
                actions: [
                  AppbarSubtitle2(
                      text: "lbl_login".tr,
                      margin:
                          getMargin(left: 16, top: 15, right: 16, bottom: 20))
                ]),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 19, right: 16, bottom: 19),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BlocSelector<SignUpBloc, SignUpState,
                                  TextEditingController?>(
                              selector: (state) => state.nameController,
                              builder: (context, nameController) {
                                return CustomTextFormField(
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller: nameController,
                                    hintText: "lbl_name".tr,
                                    variant:
                                        TextFormFieldVariant.OutlineGray20001,
                                    shape: TextFormFieldShape.RoundedBorder8,
                                    fontStyle:
                                        TextFormFieldFontStyle.InterMedium16,
                                    validator: (value) {
                                      if (!isText(value)) {
                                        return "Please enter valid text";
                                      }
                                      return null;
                                    });
                              }),
                          BlocSelector<SignUpBloc, SignUpState,
                                  TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller: emailController,
                                    hintText: "lbl_email".tr,
                                    margin: getMargin(top: 16),
                                    variant:
                                        TextFormFieldVariant.OutlineGray20001,
                                    shape: TextFormFieldShape.RoundedBorder8,
                                    fontStyle:
                                        TextFormFieldFontStyle.InterMedium16,
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "Please enter valid email";
                                      }
                                      return null;
                                    });
                              }),
                          Container(
                              margin: getMargin(top: 16),
                              padding: getPadding(
                                  left: 16, top: 14, right: 16, bottom: 14),
                              decoration: AppDecoration.outlineGray20001
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("lbl_password".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtInterMedium16Gray400),
                                    Text("lbl_show".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterMedium16)
                                  ])),
                          Padding(
                              padding: getPadding(top: 32),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgVideocamera,
                                        height: getSize(16),
                                        width: getSize(16),
                                        margin: getMargin(bottom: 20)),
                                    Container(
                                        width: getHorizontalSize(318),
                                        margin: getMargin(left: 8),
                                        child: Text("msg_i_would_like_to".tr,
                                            maxLines: null,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterRegular14))
                                  ])),
                          CustomButton(
                              height: getVerticalSize(51),
                              text: "lbl_sign_up".tr,
                              margin: getMargin(top: 39)),
                          Padding(
                              padding: getPadding(top: 16, bottom: 5),
                              child: Text("msg_forgot_your_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold16))
                        ])))));
  }

  onTapImgClose(BuildContext context) {
    NavigatorService.goBack();
  }
}
