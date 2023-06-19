import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maharishiji/widgets/curved_navigation_bar.dart';
import '../dashboard_screen/widgets/dashboard_item_widget.dart';
import '../log_in_screen/models/log_in_model.dart';
import 'bloc/dashboard_bloc.dart';
import 'models/dashboard_model.dart';
import 'models/dashboard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class DashboardScreen extends StatelessWidget {
  int _page = 0;


  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => DashboardBloc(DashboardState(
        contentModelObj: DashboardModel(),
      ))
        ..add(NetworkStatusChanged()),
      child: DashboardScreen(),
    );
  }

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    final FullName = GetStorage().read('LoggedInUser');
    var internetStatus =
        BlocProvider.of<DashboardBloc>(context).state.networkStatus.toString();
    print(internetStatus);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(
            82,
          ),
          title: Padding(
            padding: getPadding(
              left: 2,
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30, // adjust the radius as per your requirement
                  backgroundImage: NetworkImage(
                      'https://www.maharishividyamandir.com/images/chairman.jpg'),
                ),
                Flexible(
                  child: new Text(" $FullName! "),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.orange.shade700,
        body: Container(
          color:Colors.orange.shade700,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: ClipPath(
                  clipper: HeaderClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 320.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://maharishiji.net/image/HOME_GALLERY/202010/TwyL_sMl4_Maharishi5.jpg"))),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(top: 220, left: 20, right: 20),
                child: Center(
                  child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Horizon',
                      ),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Quote by ',
                            textStyle: TextStyle(
                                fontSize: 40.0, fontFamily: 'Horizon'),
                          ),
                          ScaleAnimatedText(
                            'By Maharishi Ji',
                            textStyle: TextStyle(
                                fontSize: 40.0, fontFamily: 'Horizon'),
                          ),
                          TypewriterAnimatedText(
                              '\u275D The philosophy of life is this: Life is not a struggle, not a tension... Life is bliss. It is eternal wisdom, eternal existence.\u275E'),
                        ],
                      )),
                ),
              ),
              Padding(
                  padding: getPadding(
                      top: MediaQuery.of(context).size.height-275,
                      left:MediaQuery.of(context).size.width - 80),
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/icon/' + internetStatus + '.png'),
                            fit: BoxFit.fill),
                      )))
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.deepOrangeAccent,
          items: <Widget>[
            Icon(Icons.person, size: 30),
            Icon(Icons.audiotrack, size: 30),
            Icon(Icons.video_collection, size: 30),
            Icon(Icons.article, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          onTap: (index) {
            _page = index;
            if (_page == 3) {
              NavigatorService.pushNamed(
                AppRoutes.newsEventsScreen,
              );
            }
          },
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
