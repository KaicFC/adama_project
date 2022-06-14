import 'package:flutter/material.dart';

import '../widgets.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 200,
      color: const Color.fromRGBO(14, 118, 65, 1),
      child: Column(children: const [
        SizedBox(height: 20),
        MainButton(
          buttonName: 'Produtos',
          active: true,
        ),
        MainButton(
          buttonName: 'Lotes',
        ),
        MainButton(
          buttonName: 'Reportes',
        ),
        MainButton(
          buttonName: 'Usuários',
        )
      ]),
    );
  }
}
