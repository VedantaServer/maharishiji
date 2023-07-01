import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import '../data/apiClient/api_client.dart';


class NewsEventPage extends StatefulWidget {
  const NewsEventPage({Key? key}) : super(key: key);
  @override
  State<NewsEventPage> createState() => _NewsEventPageState();
}

class _NewsEventPageState extends State<NewsEventPage> {
  final _service = ApiClient();
  int _page = 0;
  final int _limit = 5;
  bool _isFirstLoadRunning = true;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  List _posts = [];

  void _loadData(bool firstLoad) async {
    try {
      var partUrl = '/news-and-events/json/min/20/$_page/$_limit';
      final res = await _service.callApiService(partUrl);
      var responseJson = json.decode(utf8.decode(res.bodyBytes));
      setState(() {
        _posts = responseJson['data'];
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
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
        var partUrl = '/news-and-events/json/min/20/$_page/$_limit';
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
        print('error $err');
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
          title: Text('News & Events'),
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
                                      aspectRatio: 15.0 / 10.0,
                                      child: Image.network(
                                        'https://maharishiji.net/image/${_posts[index]['image']}',
                                        fit: BoxFit.fill,
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
                                                fontSize: 20,)
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
}
