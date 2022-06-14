import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../text/styled_text.dart';
import '../text/typography.dart';

class SelectorInput extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String placeholder;
  final String hint;
  final String emptyErrorText;
  final List<String> items;

  const SelectorInput({
    required this.items,
    this.placeholder = '',
    this.hint = '',
    this.onSaved,
    this.emptyErrorText = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (placeholder.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AText.label(
              placeholder,
              style: const TextStyle(
                color: Color(0xff978c86),
              ),
            ),
          ),
        const SizedBox(height: 10),
        DropdownSearch<String>(
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return emptyErrorText;
            }
            return null;
          },
          popupProps: const PopupProps.menu(
            constraints: BoxConstraints(maxHeight: 200),
            showSelectedItems: true,
          ),
          items: items,
          clearButtonProps: ClearButtonProps(isVisible: true),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).disabledColor, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: Theme.of(context).primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Theme.of(context).errorColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: Theme.of(context).primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              hintText: hint,
              filled: true,
              fillColor: Theme.of(context).cardColor,
              errorStyle: AppTypography.label.copyWith(
                color: Theme.of(context).errorColor,
              ),
              hintStyle: AppTypography.body.copyWith(
                color: const Color(0xff978c86),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
