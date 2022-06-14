import 'package:adama_agropacking_flutter_web/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class ApplicationWidget extends StatelessWidget {
  static SizeConfig? sizeConfig;
  final Widget child;

  const ApplicationWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          ApplicationWidget.sizeConfig = SizeConfig(
            constraints: constraints,
            designSize: const Size(390, 844),
          );
          return child;
        },
      ),
    );
  }
}
