import 'package:flutter/material.dart';

class ButtonActions extends StatefulWidget {
  final String icon;
  final Color overlayColor;
  final VoidCallback? onPressed;

  const ButtonActions({
    Key? key,
    required this.icon,
    required this.overlayColor,
    this.onPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ButtonActionsState();
}

class _ButtonActionsState extends State<ButtonActions> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onHover: (value) => setState(() {
        onHover = value;
      }),
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(widget.overlayColor),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(247, 245, 244, 1),
          ),
          fixedSize: MaterialStateProperty.all<Size>(const Size(60, 60))),
      onPressed: widget.onPressed,
      child: Image(
        image: AssetImage(widget.icon),
        color: onHover ? Colors.white : const Color.fromRGBO(151, 140, 134, 1),
      ),
    );
  }
}
