import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';
import 'dart:convert';
import '../data/apiClient/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class VideoDisplayPage extends StatefulWidget {
  const VideoDisplayPage({Key? key}) : super(key: key);
  @override
  State<VideoDisplayPage> createState() => _VideoDisplayPage();
}

class _VideoDisplayPage extends State<VideoDisplayPage> {
  final _service = ApiClient();
  int _page = 0;
  final int _limit = 5;
  bool _isFirstLoadRunning = true;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  List _posts = [];

  void _loadData(bool firstLoad) async {
    try {
      var partUrl = 'video/json/min';
      final res = await _service.callApiService(partUrl);
      var responseJson = json.decode(utf8.decode(res.bodyBytes));
      print(responseJson);
      setState(() {
        _posts = responseJson['data'];
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong in getting video data. $err');
      }
    }
    setState(() {
      _isFirstLoadRunning = false; //this can always stay false during the life
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        var partUrl = 'video/json/min';
        //print('loading for more...'+ partUrl);
        final res = await _service.callApiService(partUrl);
        var responseJson = json.decode(utf8.decode(res.bodyBytes));
        final List fetchedPosts = responseJson['data'];
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(responseJson['data']);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong! ${err.val}');
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _loadData(true);
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Video Content'),
        ),
        body: _isFirstLoadRunning
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Container(
            color: Colors.orangeAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: _posts.length,
                      controller: _controller,
                      itemBuilder: (_, index) => Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        elevation: 15,
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 18.0 / 13.0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                      return buildVideo(_posts[index]);
                                    },
                                  ));
                                },
                                child: Image.network(
                                  'https://maharishiji.net/image/${_posts[index]['image']}',
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
                                      '${_posts[index]['name']}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 25,)
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                if (_isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: const Center(
                      child: Text('No more content, Folks!!!'),
                    ),
                  ),
              ],
            ))

    );
  }



  Widget buildVideo(videoData) {
    print("VideoViewData" + videoData['id'].toString());
    return DefaultTextStyle(
      style: Theme
          .of(context)
          .textTheme
          .displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: fetchHtmlContent(videoData), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            print(snapshot.data);
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Html( data: snapshot.data),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }




  Future<String> fetchHtmlContent(url) async {

    final device = GetStorage();
    String username = GetStorage().read('LoggedInEmail') ; //"mahagroup1008@gmail.com";
    String password = GetStorage().read('LoggedInPassword') ; // "123456";
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    final response = await http.get(Uri.parse(device.read('serverUrl') + 'video/play/'+url['id'].toString()),
                  headers: <String, String>{'authorization': basicAuth},);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load HTML content. Status code: ${response.statusCode}');
    }
  }
}