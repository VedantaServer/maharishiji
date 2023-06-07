import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray700 = fromHex('#666666');

  static Color blueGray200 = fromHex('#bdc5cd');

  static Color gray400 = fromHex('#bdbdbd');

  static Color indigo9003f = fromHex('#3f252382');

  static Color blueGray400 = fromHex('#888888');

  static Color gray200 = fromHex('#e8e8e8');

  static Color black9003f = fromHex('#3f000000');

  static Color green600 = fromHex('#4b9360');

  static Color orange300 = fromHex('#ffb84d');

  static Color gray50 = fromHex('#fafafa');

  static Color green400 = fromHex('#5db074');

  static Color gray100 = fromHex('#f6f6f6');

  static Color green60019 = fromHex('#194b9360');

  static Color black900 = fromHex('#000000');

  static Color gray10001 = fromHex('#f7f7f7');

  static Color gray20001 = fromHex('#e7e7e7');

  static Color gray20002 = fromHex('#f0f0f0');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray20003 = fromHex('#ececec');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
