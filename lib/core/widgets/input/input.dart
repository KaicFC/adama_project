import 'package:adama_agropacking_flutter_web/core/widgets/text/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../text/typography.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final String hint;
  final TextInputType keyboard;
  final TextInputAction action;
  final bool isPassword;
  final int maxLines;
  final String? initialValue;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final String emptyErrorText;
  final String regexErrorText;
  final List<TextInputFormatter>? formatters;
  final RegExp? regExp;
  final Function(String)? onChaged;
  final String? errorText;
  final Widget? trailing;
  final Widget? leading;
  final bool enabled;

  const Input({
    this.placeholder = '',
    this.keyboard = TextInputType.text,
    this.isPassword = false,
    this.hint = '',
    this.maxLines = 1,
    this.action = TextInputAction.next,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.textController,
    this.focusNode,
    this.emptyErrorText = '',
    this.regexErrorText = '',
    this.formatters,
    this.regExp,
    this.onChaged,
    this.errorText,
    this.trailing,
    this.leading,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  late bool obscure;

  @override
  void initState() {
    obscure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.placeholder.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AText.label(
              widget.placeholder,
              style: const TextStyle(
                color: Color(0xff978c86),
              ),
            ),
          ),
        const SizedBox(height: 10),
        TextFormField(
          enabled: widget.enabled,
          onChanged: widget.onChaged,
          initialValue: widget.initialValue,
          autofocus: false,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboard,
          style: AppTypography.body.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          focusNode: widget.focusNode,
          controller: widget.textController,
          obscureText: obscure,
          validator: widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return widget.emptyErrorText;
                }

                if (widget.regExp != null) {
                  return widget.regExp!.hasMatch(value)
                      ? null
                      : widget.regexErrorText;
                }

                return null;
              },
          onSaved: widget.onSaved,
          textInputAction: widget.action,
          inputFormatters: widget.formatters,
          decoration: InputDecoration(
            errorText: widget.errorText,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).disabledColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).disabledColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Theme.of(context).errorColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            hintText: widget.hint,
            errorStyle: AppTypography.label.copyWith(
              color: Theme.of(context).errorColor,
            ),
            hintStyle: AppTypography.body.copyWith(
              color: const Color(0xff978c86),
            ),
            prefixIcon: widget.leading,
            suffixIcon: widget.trailing ??
                (widget.isPassword
                    ? Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: Icon(obscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Theme.of(context).disabledColor,
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                        ))
                    : null),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
          ),
        ),
      ],
    );
  }
}
