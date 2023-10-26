import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_story/introduction_story.dart';
import '../core/utils/size_utils.dart';
import '../main.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_button.dart';

class OnBoardingApp extends StatelessWidget {
  const OnBoardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction Story',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(1),
                separatorBuilder: (_, __) => const SizedBox(height: 1),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(10, 100, 10, 100),
                    height: MediaQuery.of(context).size.height - 200,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/maharishijilogo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 1,
              ),
            ),
            CustomButton(
              onTap: () {
                _pushIntroductionStoriesScreen(context);
              },
              height: getVerticalSize(
                50,
              ),
              margin: getMargin(
                top: 20,
              ),
              text: "Introduction",
            ),
            CustomButton(
              onTap: () {
                var isLoggedIn = GetStorage().read('isUserLoggedIn') ?? 'false';
                if (isLoggedIn == 'true') {
                  runApp(DashboardApp());
                } else {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => LoginApp(AppRoutes.logInScreen)),
                  );
                }
              },
              margin: getMargin(
                top: 20,
              ),
              shape: ButtonShape.Square,
              text: 'My Dashboard',
              height: getVerticalSize(
                50,
              ),
            ),

          ],
        ),
      ),
    );
  }

  String get _featureName => 'Maharishi Ji';

  void _pushIntroductionStoriesScreen(BuildContext context) {
    Navigator.push<void>(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => IntroductionStoryScreen(
          isDismissible: true,
          stories: [
            Story(
              imagePath: 'assets/images/Intro1.png',
              decoration: const StoryDecoration(lightMode: true),
            ),
            Story(
              imagePath: 'assets/images/Intro2.png',
              decoration: const StoryDecoration(lightMode: true),
            ),
          ],
        ),
      ),
    );
  }
}
