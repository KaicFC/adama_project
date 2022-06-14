import 'package:adama_agropacking_flutter_web/core/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xff17A255),
        backgroundColor: const Color(0xffF7F5F4),
        scaffoldBackgroundColor: const Color(0xffF7F5F4),
        cardColor: const Color(0xffFFFFFF),
        canvasColor: const Color(0xffE6E6E6),
        disabledColor: const Color(0xffDCDBDA),
        errorColor: const Color(0xffC32636),
        textTheme: const TextTheme().apply(
          fontFamily: 'SourceSansPro',
          bodyColor: const Color(0xff5D504B),
          displayColor: const Color(0xff5D504B),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xff17A255),
          secondary: Color(0xff0e7641),
          surface: Color(0xffFFFFFF),
          background: Color(0xffF7F5F4),
          error: Color(0xffC32636),
          onPrimary: Color(0xffFFFFFF),
          onSecondary: Color(0xffFFFFFF),
          onError: Color(0xffFFFFFF),
          onBackground: Color(0xff5D504B),
          onSurface: Color(0xff5D504B),
        ),
        extensions: [
          CustomColors(
            title: const Color(0xff5C504D),
            label: const Color(0xff978c86),
            body: const Color(0xff5D504B),
          )
        ],
      );
}
