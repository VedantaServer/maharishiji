
import 'dart:convert';
import 'bloc/log_in_bloc.dart';
import 'models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/core/utils/validation_functions.dart';
import 'package:maharishiji/widgets/custom_button.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

LogInScreen createState() => LogInScreen();
class LogInScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LogInBloc>(
      create: (context) => LogInBloc(LogInState(logInModelObj: LogInModel(),
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
              top: 80,
              right: 16,
              bottom: 18,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "lbl_app_name".tr,
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
                        top: 60,
                      ),
                      variant: TextFormFieldVariant.OutlineGray20001,
                      shape: TextFormFieldShape.RoundedBorder8,
                      fontStyle: TextFormFieldFontStyle.InterMedium16Black900,
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
                BlocSelector<LogInBloc, LogInState, TextEditingController?>(
                  selector: (state) => state.passwordController,
                  builder: (context, passwordController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: passwordController,
                      hintText: "lbl_password".tr,
                      margin: getMargin(
                        top: 28,
                      ),
                      variant: TextFormFieldVariant.OutlineGray20001,
                      shape: TextFormFieldShape.RoundedBorder8,
                      fontStyle: TextFormFieldFontStyle.InterMedium16Black900,
                      //textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                    );
                  },
                ),
                CustomButton(
                  onTap: () {
                    var login =  BlocProvider.of<LogInBloc>(context);
                     //print(login);
                     _ValidateUser(context,login.state.emailController?.text,
                                login.state.passwordController?.text);
                  },
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

  void _ValidateUser(context,var username,var password) {
    print('inside _vaalidate fuctnion');
    validateUser(context,username,password);
  }

  Future<void> validateUser(context,var pusername,var ppassword) async {

      String username = pusername; //"mahagroup1008@gmail.com";
      String password =  ppassword; // "123456";
      String basicAuth = 'Basic ' + base64.encode(utf8.encode('$username:$password'));

      final response = await http.post(
        Uri.parse('https://maharishiji.net/user/json/login'),
        headers: <String, String>{'authorization': basicAuth},
        body: {},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        // command executed with some response

        var responseData = json.decode(response.body);
        ShowDialog(context,'JSON', responseData);
        var isValidUser = responseData['msg'];
        var loggingUserName = responseData['data']['fullName'];
        if (isValidUser == "Success") {
          // User is valid, perform desired actions
          print (loggingUserName);
          ShowDialog(context,'Status' ,'Welcome '+loggingUserName);
        } else {
          // User is invalid, show error message
          ShowDialog(context,'Status', 'Invalid User Credentails');
        }
      }
    }
  void ShowDialog(BuildContext context, var title,var content){
    print("content:"+content);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


