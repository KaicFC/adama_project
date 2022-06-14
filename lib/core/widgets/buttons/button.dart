import 'package:flutter/material.dart';

import '../../theme/theme_extension.dart';
import '../text/styled_text.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool round;
  final bool primary;
  final bool enabled;
  final Widget? icon;

  const Button({
    required this.onPressed,
    required this.text,
    this.round = false,
    this.enabled = true,
    this.icon,
    Key? key,
  })  : primary = true,
        super(key: key);

  const Button.secondary({
    required this.onPressed,
    required this.text,
    this.round = false,
    this.enabled = true,
    this.icon,
    Key? key,
  })  : primary = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: icon ?? const SizedBox.shrink(),
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(
            primary ? 2 : 0,
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 16),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(round ? 40 : 5),
          )),
          backgroundColor: MaterialStateProperty.all<Color>(
            !enabled
                ? Theme.of(context).disabledColor
                : primary
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).backgroundColor,
          ),
        ),
        label: text.isEmpty
            ? const SizedBox.shrink()
            : AText.button(
                text,
                style: TextStyle(
                  color: primary
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).extension<CustomColors>()!.label,
                ),
              ),
      ),
    );
  }
}
