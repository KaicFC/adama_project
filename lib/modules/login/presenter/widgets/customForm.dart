import 'package:adama_agropacking_flutter_web/modules/login/presenter/pages/constrains.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final double height, width;

  final String title, hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomForm(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.obscureText,
      required this.height,
      required this.width,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: Constants.CardCustomFormPadding(height),
          child: Text(
            title,
            style: TextStyle(
                fontSize: Constants.formTextSize(height),
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 92, 80, 77)),
          ),
        ),
        Container(
          height: Constants.customFormSize(height),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 247, 245, 244),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              obscureText: obscureText,
              validator: validator,
              cursorColor: Color.fromARGB(255, 23, 162, 85),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: Constants.formTextSize(height),
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0)),
                border: InputBorder.none,
              ),
              controller: controller,
            ),
          ),
        ),
      ],
    );
  }
}