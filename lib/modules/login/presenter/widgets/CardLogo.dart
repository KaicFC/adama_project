import 'package:adama_agropacking_flutter_web/modules/login/presenter/pages/constrains.dart';
import 'package:flutter/material.dart';

class CardLogo extends StatelessWidget {
  final double height, width;

  const CardLogo({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.cardLogoPadding(height),
      child: Container(
        height: Constants.cardLogoSize(height),
        width: 149,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/slogan_adama.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
