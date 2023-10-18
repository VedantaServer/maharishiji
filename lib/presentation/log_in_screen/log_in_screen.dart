import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:maharishiji/presentation/dashboardScreen.dart';
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
        backgroundColor: Colors.orangeAccent,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 16,
              top: 50,
              right: 16,
              bottom: 18,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 80, // adjust the radius as per your requirement
                  backgroundImage:
                      AssetImage('assets/images/maharishijilogo.png'),
                ),
                Text(
                  "Maharishi Ji",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.indigo, fontSize: 45),
                ),
                BlocSelector<LogInBloc, LogInState, TextEditingController?>(
                  selector: (state) => state.emailController,
                  builder: (context, emailController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: emailController,
                      hintText: "Email",
                      margin: getMargin(
                        top: 10,
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
                      controller: passwordController,
                      hintText: "Password",
                      margin: getMargin(
                        top: 20,
                      ),
                      variant: TextFormFieldVariant.OutlineGray20001,
                      shape: TextFormFieldShape.RoundedBorder8,
                      fontStyle: TextFormFieldFontStyle.InterMedium16Black900,
                      //textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      isObscureText: true,
                    );
                  },
                ),
                CustomButton(
                  onTap: () {
                    var login = BlocProvider.of<LogInBloc>(context);
                    //print(login);
                    _ValidateUser(context, login.state.emailController?.text,
                        login.state.passwordController?.text);
                  },
                  height: getVerticalSize(
                    51,
                  ),
                  margin: getMargin(
                    top: 20,
                  ),
                  text: "Login Now!",
                ),
                Padding(
                    padding: getPadding(
                      top: 16,
                      bottom: 10,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          var login = BlocProvider.of<LogInBloc>(context);
                          //print(login);
                          _gotoRegistration(context);
                        },
                        child: Text(
                          "New Registration",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.indigo, fontSize: 25),
                          //style: AppStyle.txtInterSemiBold16,
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _ValidateUser(context, var username, var password) {
    validateUser(context, username, password);
  }

  Future<void> validateUser(context, var pusername, var ppassword) async {
    final device = GetStorage();
    String username = pusername; //"mahagroup1008@gmail.com";
    String password = ppassword; // "123456";
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));

    final response = await http.post(
      Uri.parse(device.read('serverUrl') + 'user/json/login'),
      headers: <String, String>{'authorization': basicAuth},
      body: {},

    );
    print('statusCode' + response.statusCode.toString());
    if (response.statusCode == 200) {
      // command executed with some response
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      //MaharishiLogin user = MaharishiLogin.fromJson(jsonDecode(response.body));
      var isValidUser = responseJson['msg'];
      if (isValidUser == "Success") {
        var responseData = responseJson['data'];
        print('response' + responseData.toString());
        var _loggedInUser = responseData['fullName'];
        var _loggedInUserPhoto = responseData["image"];
        // User is valid, perform desired actions
        print(_loggedInUser);
        print(_loggedInUserPhoto);
        //return showSnakeBar(context, );
        //final snackBar = SnackBar(content: Text('Welcome ' + user.data.fullName));
        //ScaffoldMessenger.of(context).showSnackBar(snackBar);
        showWarningSnackBar(context,
            'Welcome ' + _loggedInUser + '. Opening Dashboard!!!', false);

        device.write('isUserLoggedIn', 'true');
        device.write('LoggedInUser', _loggedInUser);
        device.write('LoggedInPassword', password);
        device.write('LoggedInEmail', responseData["email"]);
        device.write('LoggedInContactNumber', responseData["contactNumber"]);
        device.write('LoggedInstateName', responseData["stateName"]);
        device.write('LoggedInCityName', responseData["cityName"]);
        device.write('LoggedInandroidProductId', responseData["subscriptionPayment"][0]["subscriptionPlan"]["name"]);
        device.write('LoggedInSubStartDate',responseData["subscriptionPayment"][0]["subscriptionStartDate"][2].toString() +"-"+ responseData["subscriptionPayment"][0]["subscriptionStartDate"][1].toString() +"-"+ responseData["subscriptionPayment"][0]["subscriptionStartDate"][0].toString());
        device.write('LoggedInSubEndDate',responseData["subscriptionPayment"][0]["subscriptionEndDate"][2].toString()+"-"+responseData["subscriptionPayment"][0]["subscriptionEndDate"][1].toString()+ "-"+responseData["subscriptionPayment"][0]["subscriptionEndDate"][0].toString());


        print('photos' + _loggedInUserPhoto.toString());
        if (_loggedInUserPhoto == null)
          device.write(
              'LoggedInUserPhoto',
              _loggedInUserPhoto == null
                  ? 'ui-design/images/user.png'
                  : _loggedInUserPhoto);
        //move to dashboard page now
        Route route =
            MaterialPageRoute(builder: (context) => DashboardScreen());
        Navigator.pushReplacement(context, route);
      } else {
        // User is invalid, show error message
        //final snackBar = SnackBar(content: Text('Invalid UserID & Password, Try again!!!'));
        showWarningSnackBar(context, 'Invalid UserName or Password!!!', true);
      }
    } else {
      showWarningSnackBar(
          context, 'Unable to connect to server at this time!!!', true);
    }
  }

  Future<void> _gotoRegistration(context) async {
     //Route route = MaterialPageRoute(builder: (context) => WebRegistration(title: 'Open Web Registration',));
    //Navigator.pushReplacement(context, route);
    //const _url = 'https://flutter.dev';
    //final _url = Uri.parse('https://maharishiji.net/subscribe');
    //await launchUrl(_url);
    //if (!await launchUrl(_url)) {
   //   throw Exception('Could not launch $_url');
    //}

    //await launchUrlString(_url, mode: LaunchMode.externalApplication);

  }
}
