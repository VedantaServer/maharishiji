import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import '../data/apiClient/api_client.dart';

class TMTeacherSearchPage extends StatefulWidget {
  const TMTeacherSearchPage({Key? key}) : super(key: key);
  @override
  State<TMTeacherSearchPage> createState() => _TMTeacherSearchPageState();
}

class _TMTeacherSearchPageState extends State<TMTeacherSearchPage> {
  final _service = ApiClient();
  int _page = 0;
  final int _limit = 5;
  bool _isFirstLoadRunning = true;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  List _posts = [];

  void _loadData(bool firstLoad) async {
    try {
      var partUrl = 'tm-info/json/all-tm-teacher';
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
      try {
        _isFirstLoadRunning =
        false; //this can always stay false during the life
      } catch (e) {}
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
        var partUrl = 'jyotish-tm-slider/jyotish/json/min';
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

  bool imageTapped = false;

  void handleImageTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Find a TM Teacher'),
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 15,
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 12.0, 16.0, 8.0),
                              child: Column(
                                children: [
                                  Text('${_posts[index]['name']}' ,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  10.0, 12.0, 16.0, 8.0),
                              child: Column(
                                children: [
                                  Text(
                                      'Last Updated :${_posts[index]['updationDate']}',
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
            )));
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
