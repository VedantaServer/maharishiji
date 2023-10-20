import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maharishiji/presentation/TMTeacherSearch.dart';
import 'package:maharishiji/presentation/audioScreen.dart';
import 'package:maharishiji/presentation/homeScreen.dart';
import 'package:maharishiji/presentation/newsEventsScreen.dart';
import 'package:maharishiji/presentation/settingsScreen.dart';
import 'package:maharishiji/presentation/videoScreen.dart';
import '../core/utils/size_utils.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final _logo =  GetStorage().read('serverUrl').toString() +'/image/HOME_GALLERY/202010/TwyL_sMl4_Maharishi5.jpg';
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onNavTapped(int index) {
    setState(() {
      _page = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
        title: Padding(
          padding: getPadding(
            left: 1,
          ),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25, // adjust the radius as per your requirement
                backgroundImage: NetworkImage(_logo),
              ),
              Flexible(
                child: new Text(" Maharishi Ji... ",style: TextStyle(fontSize:30),),
              ),
            ],
          ),
        ),
      ),
      body:
      Padding(
      padding: EdgeInsets.only(bottom: 16.0),
       child:      PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        padEnds: true,
        children: [
          HomeScreen(),
          NewsEventPage(),
          AudioListenScreen(),
          VideoDisplayPage(),
          TMTeacherSearchPage(),
          SettingsScreen(),
        ],
      )),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _selectedIndex,
        backgroundColor: Colors.orangeAccent,
        height: 50,
        letIndexChange: (index) => true,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.newspaper, size: 30),
          Icon(Icons.audiotrack, size: 30),
          Icon(Icons.video_collection, size: 30),
          Icon(Icons.group, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: _onNavTapped,
      ),
    );
  }
}
