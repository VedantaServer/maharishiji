import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../data/apiClient/api_client.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool _lightIsOn = false;
  final _service = ApiClient();
  final _fullName = GetStorage().read('LoggedInUser');
  final _userPhoto = GetStorage().read('serverUrl').toString() +
      GetStorage().read('LoggedInUserPhoto').toString();
  List _posts = [];
  List _audio = [];
  bool _isFirstLoadRunning = true;

  void _loadDataNews(bool firstLoad) async {
    try {
      var partUrl = '/article/json/max/top3';
      final res = await _service.callApiService(partUrl);
      var responseJson = json.decode(utf8.decode(res.bodyBytes));
      //print(responseJson);
      setState(() {
        _posts = responseJson['data'];
      });
      //print(_posts);
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

  final dynamic listBg = [
    'assets/images/bg1.png',
    'assets/images/bg2.png',
    'assets/images/bg3.png',
    'assets/images/bg4.png',
    'assets/images/bg5.png',
    'assets/images/bg6.png',
    'assets/images/bg7.png',
    'assets/images/bg8.png',
    'assets/images/bg9.png',
    'assets/images/bg10.png',
  ];
  AssetImage pickImg() {
    late final Random rnd;
    int min = 0;
    int max = listBg.length - 1;
    rnd = Random();
    int r = min + rnd.nextInt(max - min);
    String imageName = listBg[r].toString();
    //print(imageName);
    return AssetImage(imageName);
  }

  @override
  void initState() {
    super.initState();
    _loadDataNews(true);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Column(children: <Widget>[
        CardRow(color: Colors.orangeAccent.shade400, children: [
          Column(children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: DigitalClock()),
          ]),
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
        ]),
        SizedBox(height: 10),
        Expanded(
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: pickImg(), // Replace with your image path
                  fit: BoxFit
                      .cover, // Adjust this property to control how the image fits the container
                ),
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0), bottom: Radius.circular(30.0)),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Card(
                              semanticContainer: true,
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: Column(children: [
                                Padding(
                                    padding: EdgeInsets.all(
                                        16), // Padding for the content inside the card
                                    child: Text(
                                      'Latest News & Events',
                                      style: TextStyle(fontSize: 12),
                                    )),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _posts.length,
                                    itemBuilder: (context, index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 15.0 / 10.0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute<void>(
                                                    builder:
                                                        (BuildContext context) {
                                                      return _buildImageDetail(
                                                          _posts[index]);
                                                    },
                                                  ));
                                                },
                                                child: Image.network(
                                                  'https://maharishiji.net/image/${_posts[index]['image']}',
                                                  width: 10,
                                                  height: 10,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10.0, 12.0, 16.0, 8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                      '${_posts[index]['name']} ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                              ])),
                        ),
                        Expanded(
                          child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: Column(children: [
                                Padding(
                                    padding: EdgeInsets.all(
                                        16), // Padding for the content inside the card
                                    child: Text(
                                      'Latest Audio',
                                      style: TextStyle(fontSize: 12),
                                    )),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _audio.length,
                                    itemBuilder: (context, index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 15.0 / 10.0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute<void>(
                                                    builder:
                                                        (BuildContext context) {
                                                      return _buildImageDetail(
                                                          _audio[index]);
                                                    },
                                                  ));
                                                },
                                                child: Image.network(
                                                  'https://maharishiji.net/image/${_audio[index]['image']}',
                                                  width: 50,
                                                  height: 50,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10.0, 12.0, 16.0, 8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                      '${_audio[index]['name']} ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ))
                                // Text displayed next to the eye icon
                                //style: TextStyle(fontSize: 15.0),
                              ])),
                        ),
                      ])
                ]))
          ]),
        ),
      ]),
    );
  }

  Widget _buildImageDetail(imagePath) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(imagePath['name']),
      ),
      body: SingleChildScrollView(
          child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 15,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 15.0 / 10.0,
              child: GestureDetector(
                child: Image.network(
                  'https://maharishiji.net/image/' + imagePath['image'],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 16.0, 8.0),
              child: Column(
                children: [
                  Text(imagePath['name'],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 16.0, 8.0),
              child: Column(
                children: [
                  HtmlText(
                      htmlContent: """Description :""" +
                          imagePath['description'] +
                          """""" "",
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 16.0, 8.0),
              child: Column(
                children: [
                  Row(children: [
                    Icon(Icons.remove_red_eye, size: 16),
                    // Eye icon for showing data
                    Text(
                      imagePath['viewCount'].toString(),
                      // Text displayed next to the eye icon
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Icon(
                      Icons.share,
                      size: 12,
                    ),
                    Text(
                      imagePath['shareCount'].toString(),
                      // Text displayed next to the eye icon
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 16.0, 8.0),
              child: Column(
                children: [
                  Text('Last Updated :' + imagePath['updationDate'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                      )),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blueAccent;
    Path path = Path()
      ..lineTo(0, size.height * 0.8)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height * 0.8)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CardRow extends StatelessWidget {
  final Color color;
  final List<Widget> children;
  CardRow({required this.color, required this.children});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 14.0,
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
