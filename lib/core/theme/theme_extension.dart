import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color title;
  final Color label;
  final Color body;

  CustomColors({
    required this.title,
    required this.label,
    required this.body,
  });

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      title: Color.lerp(title, other.title, t) ?? Colors.black,
      label: Color.lerp(label, other.label, t) ?? Colors.black,
      body: Color.lerp(body, other.body, t) ?? Colors.black,
    );
  }

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? title,
    Color? label,
    Color? body,
  }) {
    return CustomColors(
      title: title ?? this.title,
      label: label ?? this.label,
      body: body ?? this.body,
    );
  }
}
