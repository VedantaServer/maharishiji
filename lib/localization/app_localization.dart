import 'package:flutter/material.dart';
import 'en_us/en_us_translations.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter/cupertino.dart';

class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {'en': enUs};


  static List<String> languages() => _localizedValues.keys.toList();
  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  //Returning a SynchronousFuture here because an async "load" operation
  //cause an async "load" operation
  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}


void showWarningSnackBar(BuildContext context, String message,bool isRed) {
  print('showWarningSnackBar' + message);

// Find the Scaffold in the widget tree and use it to show a SnackBar.
  ScaffoldFeatureController<Widget, dynamic> _scaffold;
  // Find the Scaffold in the widget tree and use it to show a SnackBar.
  _scaffold = ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            width: 10,
          ),
          Text(
            message,
            maxLines: 5,
          ),
        ],
      ),
    ),
    duration: const Duration(seconds: 6),
    backgroundColor: isRed? Colors.red : Colors.green,
  ));
}