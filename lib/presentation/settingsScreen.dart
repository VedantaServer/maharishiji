import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'log_in_screen/log_in_screen.dart';
import 'onboarding_page.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              GetStorage().remove('isUserLoggedIn');
              runApp(OnBoardingApp());
            },
            child: Icon(Icons.logout_rounded),
            backgroundColor: Colors.green,
          ),
          backgroundColor: Colors.orange.shade700,
          body: Container(color: Colors.orangeAccent),
    ));
  }
}
