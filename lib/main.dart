import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maharishiji/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:maharishiji/presentation/log_in_screen/log_in_screen.dart';
import 'package:maharishiji/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/logger.dart';
import 'core/utils/navigator_service.dart';
import 'core/utils/pref_utils.dart';
import 'localization/app_localization.dart';


var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    PrefUtils().init();
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    final box = GetStorage();
    var isLoggedIn =  GetStorage().read('isUserLoggedIn');
    print(GetStorage().read('isUserLoggedIn'));
    var startScreen=  isLoggedIn == 'true' ? AppRoutes.dashboardScreen :
                     AppRoutes.logInScreen;
    runApp(MyApp(startScreen));
    //GetStorage().remove('isUserLoggedIn');
  });
}

class MyApp extends StatelessWidget {
  late final String _initialRoute;
  MyApp(String startScreen)
  {
    _initialRoute = startScreen;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      navigatorKey: NavigatorService.navigatorKey,
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
      title: 'maharishiji',
      initialRoute: _initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
