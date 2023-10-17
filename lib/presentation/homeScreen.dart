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
  void _loadMore() async {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Column(
              children: [
                CardRow(
                  color: Colors.orangeAccent,
                  children: [
                    Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 1.0),
                          child: DigitalClock()),
                    ]),
                    SizedBox(width: 36.0),
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
                SizedBox(height: 2.0),
                CardRow(
                  color: Colors.orangeAccent.shade400,
                  children: [
                    CardColumn(
                      icon: Icons.volume_up,
                      title: "Recent News...",
                      content: "These are most recent news available.",
                    ),
                   ]
                ),
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _posts.length,
                      itemBuilder: (_, index) => Card(
                        elevation: 8,
                        margin: const EdgeInsets.all(3.0),
                              child: Column(
                                children: [
                                  Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) {
                                                return _buildImageDetail(
                                                    _posts[index]);
                                              },
                                            ));
                                      },
                                      child:Row(
                                        children: [Image.network(
                                        'https://maharishiji.net/image/' + _posts[index]['image'],
                                        fit: BoxFit.fill,
                                          width: 50,
                                          height: 50,
                                      ), Text('${_posts[index]['name']}',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          )),
                                      ]),
                                    ),
                                  )

                                ],
                              ),
                      )),
                ),
                SizedBox(height: 6.0),
                CardRow(
                  color: Colors.green,
                  children: [
                    CardColumn(
                      icon: Icons.music_note,
                      title: 'Latest Audio',
                      content: 'List of  top  3 audion will show here ',
                    ),
                  ],
                ),
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _audio.length,
                      itemBuilder: (_, index) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        elevation: 10,
                        margin: const EdgeInsets.all(3.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 12.0, 16.0, 8.0),
                              child: Column(
                                children: [
                                  Row(
                                      children: [
                                        Text(
                                          '${_audio[index]['name']}',
                                          // Text displayed next to the eye icon
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ]
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
         ));
  }
  Widget _buildImageDetail(imagePath) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(imagePath['name']),
      ),
      body: SingleChildScrollView(
          child:
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
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
                  padding: EdgeInsets.fromLTRB(
                      10.0, 12.0, 16.0, 8.0),
                  child: Column(
                    children: [
                      Text(
                          imagePath['name'],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 20,)
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      10.0, 12.0, 16.0, 8.0),
                  child: Column(
                    children: [
                      HtmlText(htmlContent:"""Description :""" + imagePath['description']+""""""""
                          ,textAlign: TextAlign.left),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(
                      10.0, 12.0, 16.0, 8.0),

                  child: Column(
                    children: [
                      Row(
                          children: [
                            Icon(Icons.remove_red_eye, size: 16),
                            // Eye icon for showing data
                            Text(
                              imagePath['viewCount'].toString(),
                              // Text displayed next to the eye icon
                              style: TextStyle(fontSize: 12.0),
                            ),
                            Icon(Icons.share, size: 12,

                            ),
                            Text(
                              imagePath['shareCount'].toString(),
                              // Text displayed next to the eye icon
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ]
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      10.0, 12.0, 16.0, 8.0),
                  child: Column(
                    children: [
                      Text(
                          'Last Updated :' + imagePath['updationDate'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 10,)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )

      ),
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
          htmlContent
              .replaceAll(RegExp(r'<[^>]*>'), ''), // Remove HTML tags
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}