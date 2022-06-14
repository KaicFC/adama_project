// ignore_for_file: use_key_in_widget_constructors

import 'package:adama_agropacking_flutter_web/core/theme/theme_extension.dart';
import 'package:adama_agropacking_flutter_web/core/widgets/text/typography.dart';
import 'package:flutter/material.dart';

class AText extends Text {
  const AText(text, {TextStyle? style}) : super(text, style: style);

  AText.title(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.title.merge(style), textAlign: align);

  AText.title2(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.title2.merge(style), textAlign: align);

  AText.title3(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.title3.merge(style), textAlign: align);

  AText.label(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.label.merge(style), textAlign: align);

  AText.label2(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.label2.merge(style), textAlign: align);

  AText.body(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.body.merge(style), textAlign: align);

  AText.body2(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.body2.merge(style), textAlign: align);

  AText.body3(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.body3.merge(style), textAlign: align);

  AText.button(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.button.merge(style), textAlign: align);
}

class TitleText extends StatelessWidget {
  final String text;
  final TextAlign align;

  const TitleText(
    this.text, {
    Key? key,
    this.align = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: AppTypography.title3.copyWith(
        color: Theme.of(context).extension<CustomColors>()!.title,
      ),
    );
  }
}
