import 'package:adama_agropacking_flutter_web/modules/login/presenter/pages/constrains.dart';
import 'package:flutter/material.dart';

class CardForgotPassword extends StatelessWidget {
  final double height, width;

  const CardForgotPassword({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.CardEsqueciSenhaPadding(height),
      child: Center(
        child: Text(
          'Esqueci minha senha',
          style: TextStyle(
            fontSize: Constants.formTextSize(height),
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 23, 162, 85),
          ),
        ),
      ),
    );
  }
}
