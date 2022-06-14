import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String buttonName;
  final bool active;

  const MainButton({Key? key, required this.buttonName, this.active = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: const Size(160, 60),
        backgroundColor:
            active ? const Color.fromRGBO(23, 162, 85, 1) : Colors.transparent,
      ),
      child: Center(
        child: Text(
          buttonName,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
