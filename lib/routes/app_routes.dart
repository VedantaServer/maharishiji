import 'package:flutter/material.dart';
import 'package:maharishiji/presentation/images_screen/images_screen.dart';
import 'package:maharishiji/presentation/cover_screen/cover_screen.dart';
import 'package:maharishiji/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:maharishiji/presentation/log_in_screen/log_in_screen.dart';
import 'package:maharishiji/presentation/feed_screen/feed_screen.dart';
import 'package:maharishiji/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:maharishiji/presentation/market_screen/market_screen.dart';
import 'package:maharishiji/presentation/congratulations_screen/congratulations_screen.dart';
import 'package:maharishiji/presentation/search_screen/search_screen.dart';
import 'package:maharishiji/presentation/blog_post_screen/blog_post_screen.dart';
import 'package:maharishiji/presentation/expenses_screen/expenses_screen.dart';
import 'package:maharishiji/presentation/calendar_screen/calendar_screen.dart';
import 'package:maharishiji/presentation/profile_posts_screen/profile_posts_screen.dart';
import 'package:maharishiji/presentation/profile_photos_screen/profile_photos_screen.dart';
import 'package:maharishiji/presentation/market_one_screen/market_one_screen.dart';
import 'package:maharishiji/presentation/rating_screen/rating_screen.dart';
import 'package:maharishiji/presentation/radios_screen/radios_screen.dart';
import 'package:maharishiji/presentation/compose_screen/compose_screen.dart';
import 'package:maharishiji/presentation/images_one_screen/images_one_screen.dart';
import 'package:maharishiji/presentation/insights_screen/insights_screen.dart';
import 'package:maharishiji/presentation/calendar_one_screen/calendar_one_screen.dart';
import 'package:maharishiji/presentation/compose_one_screen/compose_one_screen.dart';
import 'package:maharishiji/presentation/bottom_drawer_screen/bottom_drawer_screen.dart';
import 'package:maharishiji/presentation/profile_posts_one_screen/profile_posts_one_screen.dart';
import 'package:maharishiji/presentation/profile_posts_two_screen/profile_posts_two_screen.dart';
import 'package:maharishiji/presentation/ios_status_bar_screen/ios_status_bar_screen.dart';
import 'package:maharishiji/presentation/ios_navigation_screen/ios_navigation_screen.dart';
import 'package:maharishiji/presentation/inputs_two_screen/inputs_two_screen.dart';
import 'package:maharishiji/presentation/inputs_one_screen/inputs_one_screen.dart';
import 'package:maharishiji/presentation/inputs_screen/inputs_screen.dart';
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

  static Map<String, WidgetBuilder> get routes => {
        imagesScreen: ImagesScreen.builder,
        coverScreen: CoverScreen.builder,
        signUpScreen: SignUpScreen.builder,
        logInScreen: LogInScreen.builder,
        feedScreen: FeedScreen.builder,
        contentScreen: DashboardScreen.builder,
        marketScreen: MarketScreen.builder,
        congratulationsScreen: CongratulationsScreen.builder,
        searchScreen: SearchScreen.builder,
        blogPostScreen: BlogPostScreen.builder,
        expensesScreen: ExpensesScreen.builder,
        calendarScreen: CalendarScreen.builder,
        profilePostsScreen: ProfilePostsScreen.builder,
        profilePhotosScreen: ProfilePhotosScreen.builder,
        marketOneScreen: MarketOneScreen.builder,
        ratingScreen: RatingScreen.builder,
        radiosScreen: RadiosScreen.builder,
        composeScreen: ComposeScreen.builder,
        imagesOneScreen: ImagesOneScreen.builder,
        insightsScreen: InsightsScreen.builder,
        calendarOneScreen: CalendarOneScreen.builder,
        composeOneScreen: ComposeOneScreen.builder,
        bottomDrawerScreen: BottomDrawerScreen.builder,
        profilePostsOneScreen: ProfilePostsOneScreen.builder,
        profilePostsTwoScreen: ProfilePostsTwoScreen.builder,
        iosStatusBarScreen: IosStatusBarScreen.builder,
        iosNavigationScreen: IosNavigationScreen.builder,
        inputsTwoScreen: InputsTwoScreen.builder,
        inputsOneScreen: InputsOneScreen.builder,
        inputsScreen: InputsScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: ImagesScreen.builder,


      };
}
