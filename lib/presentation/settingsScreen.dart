import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:maharishiji/presentation/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/core/utils/validation_functions.dart';
import 'package:maharishiji/widgets/custom_button.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import '../data/apiClient/api_client.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:maharishiji/presentation/log_in_screen/log_in_screen.dart';
import 'package:maharishiji/main.dart';
import 'package:maharishiji/presentation/onboarding_page.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreen();
}

class _SettingsScreen  extends State<SettingsScreen> {
  final _service = ApiClient();
  final _fullName = GetStorage().read('LoggedInUser');
  final _userPhoto = GetStorage().read('serverUrl').toString() +
      GetStorage().read('LoggedInUserPhoto').toString();
  final _contactNumber = GetStorage().read('LoggedInContactNumber');
  final _stateName = GetStorage().read('LoggedInstateName');
  final _cityName = GetStorage().read('LoggedInCityName');
  final _email = GetStorage().read('LoggedInEmail');
  final _androidProductId = GetStorage().read('LoggedInandroidProductId');
  final _startdate = GetStorage().read('LoggedInSubStartDate');
  final _enddate = GetStorage().read('LoggedInSubEndDate');



  int _page = 0;
  final int _limit = 5;
  bool _isFirstLoadRunning = true;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  List _posts = [];
  List _audio = [];
  final device = GetStorage();
  String aa = "";


  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
  }

  void _loadMore() async {

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        resizeToAvoidBottomInset: false,
        body: Center(
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
                  NetworkImage('$_userPhoto'),
                ),
                SizedBox(height: 15),
                Text(
                  ' $_fullName!',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.indigo, fontSize: 24),
                ),
                SizedBox(height: 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.email, // The email icon
                          size: 24.0, // Set the size of the icon
                          color: Colors.blue, // Set the color of the icon
                        ),
                      ),
                      Text(
                          '$_email' ,
                          style: TextStyle(fontSize: 16, color: Colors.indigo)
                      ),
                    ]
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.phone, // The email icon
                          size: 24.0, // Set the size of the icon
                          color: Colors.blue, // Set the color of the icon
                        ),
                      ),
                      Text(
                          '$_contactNumber' ,
                          style: TextStyle(fontSize: 16, color: Colors.indigo)
                      ),
                    ]
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          '$_cityName' ,
                          style: TextStyle(fontSize: 16, color: Colors.indigo)
                      ),
                    ]
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          '$_stateName' ,
                          style: TextStyle(fontSize: 16, color: Colors.indigo)
                      ),
                    ]
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          '$_androidProductId' ,
                          style: TextStyle(fontSize: 16, color: Colors.indigo)
                      ),
                    ]
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Subscription  $_startdate from $_enddate ' ,
                          style: TextStyle(fontSize: 16, color: Colors.indigo)
                      ),
                    ]
                ),
                SizedBox(height: 60),
                MyLogoutButton(),
              ],

            ),
          ),
        ),
      ),
    );
  }
}

class MyLogoutButton extends StatelessWidget {
  @override
  final device = GetStorage();
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        device.erase();
        // Add your logout logic here
        // For example, you can navigate to a login screen
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => OnBoardingApp())
        );
    }
    ,
      child: Text('Logout'),
    );
  }
}
class CardRow extends StatelessWidget {
  final Color color;
  final List<Widget> children;
  CardRow({required this.color, required this.children});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        color: color,
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

class CardColumn extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  CardColumn({required this.icon, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 18.0,
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          content,
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class HtmlText extends StatelessWidget {
  final String htmlContent;
  final TextAlign textAlign;
  HtmlText({required this.htmlContent, this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          htmlContent
              .replaceAll(RegExp(r'<[^>]*>'), ''), // Remove HTML tags
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}