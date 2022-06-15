import 'package:flutter/material.dart';

class Constants {
  static EdgeInsets cardFormularioPadding(double height, double width) {
    return height > width || width < 800
        ? EdgeInsets.only(left: 0)
        : EdgeInsets.only(left: 120);
  }

  static CrossAxisAlignment cardFormularioColumnCrossAxis(
      double height, double width) {
    return height > width || width < 800
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
  }

  static double fontSizeStyle(double height) {
    return height > 585
        ? 18
        : height < 380
            ? 10
            : height < 430
                ? 12
                : 14;
  }

  static double buttomSize(double height) {
    return height > 585
        ? 40
        : height < 380
            ? 8
            : height < 430
                ? 20
                : 30;
  }

  static double buttomTextSize(double height) {
    return height > 585
        ? 14
        : height < 380
            ? 8
            : height < 430
                ? 10
                : 12;
  }

  static EdgeInsets CardEsqueciSenhaPadding(double height) {
    return height < 380
        ? EdgeInsets.only(top: 10, bottom: 5)
        : EdgeInsets.only(top: 20, bottom: 10);
  }

  static double formTextSize(double height) {
    return height > 585
        ? 14
        : height < 380
            ? 8
            : height < 430
                ? 10
                : 12;
  }

  static EdgeInsets CardCustomFormPadding(double height) {
    return height > 585
        ? EdgeInsets.only(top: 20, bottom: 10)
        : EdgeInsets.only(top: 10, bottom: 5);
  }

  static double customFormSize(double height) {
    return height > 585
        ? 40
        : height < 380
            ? 8
            : height < 430
                ? 20
                : 30;
  }

  static EdgeInsets cardLogoPadding(double height) {
    return height > 585
        ? EdgeInsets.only(bottom: 50)
        : height < 380
            ? EdgeInsets.only(bottom: 5)
            : EdgeInsets.only(bottom: 20);
  }

  static double cardLogoSize(double height) {
    return height > 585
        ? 112
        : height < 430
            ? 50
            : 82;
  }

  static double fieldSize(double height) {
    return height > 585
        ? 80
        : height < 380
            ? 40
            : height < 430
                ? 50
                : 60;
  }
}
