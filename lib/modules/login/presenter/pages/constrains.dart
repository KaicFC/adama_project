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
    return height > 530
        ? 18
        : height < 300
            ? 10
            : height < 370
                ? 12
                : 14;
  }

  static double buttomSize(double height) {
    return height > 530
        ? 40
        : height < 300
            ? 8
            : height < 370
                ? 20
                : 30;
  }

  static double buttomTextSize(double height) {
    return height > 530
        ? 14
        : height < 300
            ? 8
            : height < 370
                ? 10
                : 12;
  }

  static EdgeInsets CardEsqueciSenhaPadding(double height) {
    return height < 300
        ? EdgeInsets.only(top: 10, bottom: 5)
        : EdgeInsets.only(top: 20, bottom: 10);
  }

  static double formTextSize(double height) {
    return height > 530
        ? 14
        : height < 300
            ? 8
            : height < 370
                ? 10
                : 12;
  }

  static EdgeInsets CardCustomFormPadding(double height) {
    return height > 530
        ? EdgeInsets.only(top: 20, bottom: 10)
        : EdgeInsets.only(top: 10, bottom: 5);
  }

  static double customFormSize(double height) {
    return height > 530
        ? 40
        : height < 300
            ? 8
            : height < 370
                ? 20
                : 30;
  }

  static EdgeInsets cardLogoPadding(double height) {
    return height > 530
        ? EdgeInsets.only(bottom: 50)
        : height < 300
            ? EdgeInsets.only(bottom: 5)
            : EdgeInsets.only(bottom: 20);
  }

  static double cardLogoSize(double height) {
    return height > 530
        ? 112
        : height < 370
            ? 50
            : 82;
  }
}
