import 'package:flutter/material.dart';

import '../../../../../core/widgets/widgets.dart';

class ActionsProductTableWidget extends StatelessWidget {
  const ActionsProductTableWidget({
    Key? key,
    required this.onTapDelete,
    required this.onTapEdit,
  }) : super(key: key);

  final VoidCallback onTapDelete;
  final VoidCallback onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ButtonActions(
            icon: 'assets/images/delete_icon.png',
            overlayColor: const Color.fromRGBO(195, 38, 54, 1),
            onPressed: onTapDelete,
          ),
        ),
        ButtonActions(
          icon: 'assets/images/edit_icon.png',
          overlayColor: const Color.fromRGBO(26, 161, 221, 1),
          onPressed: onTapEdit,
        ),
      ],
    );
  }
}
