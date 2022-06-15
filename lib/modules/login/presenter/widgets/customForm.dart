import 'package:adama_agropacking_flutter_web/modules/login/presenter/pages/constrains.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomForm extends StatelessWidget {
  final double height, width;

  final String? title, hintText, labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputFormatter formatter;

  const CustomForm({
    Key? key,
    required this.title,
    required this.hintText,
    required this.obscureText,
    required this.height,
    required this.width,
    this.validator,
    this.onChanged,
    this.labelText,
    this.controller,
    required this.formatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: Constants.CardCustomFormPadding(height),
          child: Text(
            title!,
            style: TextStyle(
                fontSize: Constants.formTextSize(height),
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 92, 80, 77)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            textAlignVertical: TextAlignVertical.center,
            obscureText: obscureText,
            validator: validator,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              formatter
            ],
            cursorColor: const Color.fromARGB(255, 23, 162, 85),
            style: TextStyle(
                fontSize: Constants.formTextSize(height),
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
              filled: true,
              constraints:
                  BoxConstraints.tightFor(height: Constants.fieldSize(height)),
              fillColor: const Color.fromARGB(255, 247, 245, 244),
              labelText: labelText,
              labelStyle: TextStyle(
                  fontSize: Constants.formTextSize(height),
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0)),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: Constants.formTextSize(height),
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              errorStyle: TextStyle(
                fontSize: Constants.formTextSize(height),
                fontWeight: FontWeight.w300,
                color: Colors.red,
              ),
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
