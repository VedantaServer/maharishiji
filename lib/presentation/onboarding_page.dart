import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:maharishiji/presentation/log_in_screen/log_in_screen.dart';
import '../data/apiClient/api_client.dart';
import '../main.dart';
import '../routes/app_routes.dart';

class OnBoardingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //navigatorKey: NavigatorService.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Maharishi Ji',
      home: PageState(),
    );
  }
}

class PageState extends StatefulWidget {
  const PageState({Key? key}) : super(key: key);
  @override
  State<PageState> createState() => _OnBoardingPage();
}

class _OnBoardingPage extends State<PageState> {
  @override
  final _service = ApiClient();
  List _pages = [];
  final List<PageViewModel> _OnBoardingPages = [];
  void _loadData() async {
    try {
      var partUrl = 'home-gallery/json/all/true';
      final res = await _service.callApiService(partUrl);
      var responseJson = json.decode(utf8.decode(res.bodyBytes));
      setState(() {
        _pages = responseJson['data'];
        for (var i = 0; i < _pages.length; i++) {
          _OnBoardingPages.add(new PageViewModel(
            title: _pages[i]['title'],
            body: _pages[i]['description'],
            image:  Image.network(
                'https://maharishiji.net/image/' + _pages[i]['image']),
            decoration: getPageDecoration(),
          ));
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: _OnBoardingPages,
        done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: Text('Skip'),
        onSkip: () => goToHome(context),
        next: Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: Colors.orangeAccent,
        nextFlex: 0,
      ),
    );
  }
  void goToHome(context) {
    GetStorage().write('isOnBoarding', 'done');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginApp(AppRoutes.logInScreen)),
    );
  }

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: Colors.indigo,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(44),
        pageColor: Colors.orangeAccent,
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required Key key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        child: Text(
          text,
          style: TextStyle(color: Colors.orangeAccent, fontSize: 16),
        ),
      );
}
