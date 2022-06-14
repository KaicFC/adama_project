import 'package:adama_agropacking_flutter_web/core/utils/application.dart';

class Extensions {}

extension SizeExtension on num {
  double get w => ApplicationWidget.sizeConfig?.setWidth(this) ?? this * 1;

  double get h => ApplicationWidget.sizeConfig?.setHeight(this) ?? this * 1;

  double get fs => ApplicationWidget.sizeConfig?.setFontSize(this) ?? this * 1;
}
