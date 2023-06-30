import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maharishiji/presentation/audioScreen.dart';
import 'package:maharishiji/presentation/chatGPTScreen.dart';
import 'package:maharishiji/presentation/newsEventsScreen.dart';
import 'package:maharishiji/widgets/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import 'log_in_screen/log_in_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              GetStorage().remove('isUserLoggedIn');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogInScreen.builder(context),
                ),
              );
            },
            child: Icon(Icons.logout_rounded),
            backgroundColor: Colors.green,
          ),
          backgroundColor: Colors.orange.shade700,
          body: Container(color: Colors.orangeAccent),
    ));
  }
}
