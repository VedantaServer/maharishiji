import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maharishiji/presentation/dashboardScreen.dart';
import 'package:maharishiji/presentation/onboarding_page.dart';
import 'package:maharishiji/routes/app_routes.dart';
import 'core/utils/logger.dart';
import 'core/utils/pref_utils.dart';
import 'localization/app_localization.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  await GetStorage.init();
  final device = GetStorage();
  device.write('serverUrl', 'https://maharishiji.net/');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    PrefUtils().init();
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(OnBoardingApp());
    //GetStorage().remove('isUserLoggedIn');
  });
}

class LoginApp extends StatelessWidget {
  late final String _initialRoute;
  LoginApp(String startScreen) {
    _initialRoute = startScreen;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //navigatorKey: NavigatorService.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      scaffoldMessengerKey: globalMessengerKey,
      //for setting localization strings
      supportedLocales: const [
        Locale('en', ''),
      ],
      localizationsDelegates: [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Maharishi Ji',
      initialRoute: _initialRoute,
      routes: AppRoutes.routes,
    );
  }
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //navigatorKey: NavigatorService.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      scaffoldMessengerKey: globalMessengerKey,
      //for setting localization strings
      supportedLocales: const [
        Locale('en', ''),
      ],
      localizationsDelegates: [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Maharishi Ji',
      home: DashboardScreen(),
    );
  }
}
