import 'package:flutter/material.dart';

import '../../../../../core/widgets/widgets.dart';

class FilterProductsWidget extends StatelessWidget {
  const FilterProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        height: 64,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 60, left: 20),
              child: Text(
                'Itens por página',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'Tudo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: MainDropDown(
                defaultValue: '50',
                values: ['50', '100', '150', '200'],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: MainDropDown(
                defaultValue: 'A - Z',
                values: ['A - Z', 'Z - A'],
              ),
            ),
            MainDropDown(
              defaultValue: 'Filtrar',
              values: ['Filtrar', 'Filtrar 1', 'Filtrar 2', 'Filtrar 3'],
            ),
          ],
        ),
      ),
    );
  }
}
