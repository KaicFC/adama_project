import 'package:flutter/material.dart';

class AdamaGreenButton extends StatelessWidget {
  const AdamaGreenButton({
    Key? key,
    this.onTap,
    this.text = '',
    required this.label,
    this.leading,
  }) : super(key: key);

  final Function()? onTap;
  final String text;
  final String label;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Container());
  }
}
