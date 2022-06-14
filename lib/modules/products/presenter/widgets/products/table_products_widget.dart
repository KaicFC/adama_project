import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/products_cubit/products_cubit.dart';
import 'actions_product_table_widget.dart';

class TableProductsWidget extends StatelessWidget {
  const TableProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductsCubit>().state;

    final headerTable = [
      'Produto',
      'Código SAP',
      'Classificação',
      'Packing',
      'Ações',
    ];

    return DataTable(
      columns: headerTable.generateHeaderTable(),
      rows: state.products
          .map(
            (product) => DataRow(
              cells: [
                DataCell(Text(product.name).styleCellTable()),
                DataCell(Text(product.sapCode).styleCellTable()),
                DataCell(Text(product.classification).styleCellTable()),
                DataCell(Text(product.packing).styleCellTable()),
                DataCell(
                  ActionsProductTableWidget(
                    onTapDelete: () {},
                    onTapEdit: () {},
                  ),
                ),
              ],
            ),
          )
          .toList(),
    ).toDecoration();
  }
}

extension on DataTable {
  Widget toDecoration() => Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        child: this,
      );
}

extension on List {
  List<DataColumn> generateHeaderTable() => List.generate(
        length,
        (index) => DataColumn(
          label: Text(
            this[index],
            style: const TextStyle(
              color: Color.fromRGBO(137, 138, 141, 1),
              fontSize: 20,
              height: 1.24,
            ),
          ),
        ),
      );
}

extension on Text {
  Text styleCellTable() => Text(
        data ?? '',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          height: 1.24,
        ),
      );
}
