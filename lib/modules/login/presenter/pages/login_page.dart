import 'package:adama_agropacking_flutter_web/modules/login/presenter/pages/constrains.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/state/login_cubit/login_cubit.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/widgets/CardFormLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          body: Container(
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/curves.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: CardFormLogin(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class FormTitle extends StatelessWidget {
  final double height, width;

  const FormTitle({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login Administrador',
      style: TextStyle(
          fontSize: Constants.fontSizeStyle(height),
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 92, 80, 77)),
    );
  }
}

class ButtomEntrar extends StatelessWidget {
  final double height, width;
  final void Function() onTap;

  const ButtomEntrar({
    Key? key,
    required this.height,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.buttomSize(height),
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 23, 162, 85)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          'ENTRAR',
          style: TextStyle(
            fontSize: Constants.buttomTextSize(height),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
