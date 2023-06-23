import 'package:flutter/material.dart';

import 'package:maharishiji/presentation/cover_screen/cover_screen.dart';
import 'package:maharishiji/presentation/newsEventsScreen.dart';
import 'package:maharishiji/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:maharishiji/presentation/log_in_screen/log_in_screen.dart';
import 'package:maharishiji/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:maharishiji/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {

  static const String dashboardScreen = '/dashboard_screen';

  static const String imagesScreen = '/images_screen';

  static const String coverScreen = '/cover_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String logInScreen = '/log_in_screen';

  static const String feedScreen = '/feed_screen';

  static const String contentScreen = '/dashboard_screen';

  static const String marketScreen = '/market_screen';

  static const String congratulationsScreen = '/congratulations_screen';

  static const String searchScreen = '/search_screen';

  static const String blogPostScreen = '/blog_post_screen';

  static const String expensesScreen = '/expenses_screen';

  static const String calendarScreen = '/calendar_screen';

  static const String profilePostsScreen = '/profile_posts_screen';

  static const String profilePhotosScreen = '/profile_photos_screen';

  static const String marketOneScreen = '/market_one_screen';

  static const String ratingScreen = '/rating_screen';

  static const String radiosScreen = '/radios_screen';

  static const String composeScreen = '/compose_screen';

  static const String imagesOneScreen = '/images_one_screen';

  static const String insightsScreen = '/insights_screen';

  static const String calendarOneScreen = '/calendar_one_screen';

  static const String composeOneScreen = '/compose_one_screen';

  static const String bottomDrawerScreen = '/bottom_drawer_screen';

  static const String profilePostsOneScreen = '/profile_posts_one_screen';

  static const String profilePostsTwoScreen = '/profile_posts_two_screen';

  static const String iosStatusBarScreen = '/ios_status_bar_screen';

  static const String iosNavigationScreen = '/ios_navigation_screen';

  static const String inputsTwoScreen = '/inputs_two_screen';

  static const String inputsOneScreen = '/inputs_one_screen';

  static const String inputsScreen = '/inputs_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String newsEventsScreen = '/newsEventsScreen';

  static Map<String, WidgetBuilder> get routes => {
        //newsEventsScreen:NewsEventScreen.builder,
        coverScreen: CoverScreen.builder,
        signUpScreen: SignUpScreen.builder,
        logInScreen: LogInScreen.builder,
        contentScreen: DashboardScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
      };
}
