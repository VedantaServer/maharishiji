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
                    height: MediaQuery.of(context).size.height - 300,
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
                  51,
                ),
                text: "Introduction",
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10)),
            Center(
              child: TextButton(
                onPressed: () {
                  var isLoggedIn =
                      GetStorage().read('isUserLoggedIn') ?? 'false';
                  if (isLoggedIn == 'true' ) {
                    runApp(DashboardApp());
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (_) => LoginApp(AppRoutes.logInScreen)),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                ),
                child: Text(
                  'Login Now',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String get _featureName => 'Grocery Store';

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
              title: 'Maharishji Mobile App',
              name: _featureName,
              description:
                  '"Maharishiji.net Mobile App & Website is dedicated to His Holiness Maharishi Mahesh Yogi Ji',
              decoration: const StoryDecoration(lightMode: true),
            ),
            Story(
              imagePath: 'assets/images/Intro2.png',
              title: 'By Brahmachari Girish Ji',
              name: _featureName,
              description:
                  '"Dedicated to His Holiness Maharishi Mahesh Yogi Ji.',
              decoration: const StoryDecoration(lightMode: true),
            ),
          ],
        ),
      ),
    );
  }
}
