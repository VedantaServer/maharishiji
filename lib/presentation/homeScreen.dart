import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import '../data/apiClient/api_client.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final _service = ApiClient();
  final _fullName = GetStorage().read('LoggedInUser');
  final _userPhoto = GetStorage().read('serverUrl').toString() +
      GetStorage().read('LoggedInUserPhoto').toString();

  int _page = 0;
  final int _limit = 5;
  bool _isFirstLoadRunning = true;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  List _posts = [];
  List _audio = [];

  void _loadDataNews(bool firstLoad) async {
    try {
      var partUrl = '/article/json/max/top3';
      final res = await _service.callApiService(partUrl);
      var responseJson = json.decode(utf8.decode(res.bodyBytes));
      setState(() {
        _posts = responseJson['data'];
      });

      var audioUrl = '/audio/json/max/top3';
      final res1 = await _service.callApiService(audioUrl);
      var response1Json = json.decode(utf8.decode(res1.bodyBytes));
      setState(() {
        _audio = response1Json['data'];
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong in home news');
      }
    }
    setState(() {
      _isFirstLoadRunning = false; //this can always stay false during the life
    });
  }

  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _loadDataNews(true);
    _controller = ScrollController()..addListener(_loadMore);
  }

  void _loadMore() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Column(children: <Widget>[
        Row(
          //ROW 1
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: CardRow(
                color: Colors.orangeAccent,
                children: [
                  Column(children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: DigitalClock()),
                  ]),
                  SizedBox(width: 86.0),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: ClipPath(
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(_userPhoto))),
                            ),
                          )),
                      Text(
                        ' $_fullName!',
                        style: TextStyle(fontSize: 12, color: Colors.indigo),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Expanded(
            child: GridView.count(
          primary: true,
          padding: const EdgeInsets.all(30),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/video.png'),
                      fit: BoxFit.cover)),
              child: const Text('Videos',style: TextStyle(color: Colors.purpleAccent),),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/audio.png'),
                      fit: BoxFit.cover)),

              child: const Text('Audio'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('New & Events'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('Articles'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: const Text('Find a TM Teacher'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: const Text('Jyotish and Vedic Astrology Consultant'),
            ),
          ],
        ))
      ]),
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
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        color: color,
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late Timer timer;
  late DateTime currentTime;
  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('hh:mm:ss a');
    final dayFormat = DateFormat('EEEE');
    final monthFormat = DateFormat('dd,MMMM');
    final currentTimeFormatted = timeFormat.format(currentTime);
    final currentDayFormatted = dayFormat.format(currentTime);
    final currentMonthFormatted = monthFormat.format(currentTime);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4.0,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    currentDayFormatted,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigoAccent),
                  ),
                  SizedBox(height: 8),
                  Text(
                    currentMonthFormatted,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            currentTimeFormatted,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
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
          htmlContent.replaceAll(RegExp(r'<[^>]*>'), ''), // Remove HTML tags
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
