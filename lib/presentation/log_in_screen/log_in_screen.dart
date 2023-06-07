import 'bloc/log_in_bloc.dart';
import 'models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/core/utils/validation_functions.dart';
import 'package:maharishiji/widgets/custom_button.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';

class LogInScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LogInBloc>(
      create: (context) => LogInBloc(LogInState(
        logInModelObj: LogInModel(),
      ))
        ..add(LogInInitialEvent()),
      child: LogInScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 16,
              top: 18,
              right: 16,
              bottom: 18,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "lbl_log_in2".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold30,
                ),
                BlocSelector<LogInBloc, LogInState, TextEditingController?>(
                  selector: (state) => state.emailController,
                  builder: (context, emailController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: emailController,
                      hintText: "lbl_email".tr,
                      margin: getMargin(
                        top: 28,
                      ),
                      variant: TextFormFieldVariant.OutlineGray20001,
                      shape: TextFormFieldShape.RoundedBorder8,
                      fontStyle: TextFormFieldFontStyle.InterMedium16,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null ||
                            (!isValidEmail(value, isRequired: true))) {
                          return "Please enter valid email";
                        }
                        return null;
                      },
                    );
                  },
                ),
                Container(
                  margin: getMargin(
                    top: 16,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 14,
                    right: 16,
                    bottom: 14,
                  ),
                  decoration: AppDecoration.outlineGray20001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_password".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterMedium16Gray400,
                      ),
                      Text(
                        "lbl_show".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterMedium16,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomButton(
                  height: getVerticalSize(
                    51,
                  ),
                  text: "lbl_log_in2".tr,
                ),
                Padding(
                  padding: getPadding(
                    top: 16,
                    bottom: 294,
                  ),
                  child: Text(
                    "msg_forgot_your_password".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold16,
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
