import 'package:flutter/material.dart';

import 'products_widgets.dart';

class BodyProductsWidgetWidget extends StatelessWidget {
  const BodyProductsWidgetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderProductsWidget(),
          const FilterProductsWidget(),
          const TableProductsWidget(),
        ],
      ),
    );
  }
}
