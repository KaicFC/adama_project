import 'package:adama_agropacking_flutter_web/core/theme/light_theme.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/pages/login_page.dart';
import 'package:adama_agropacking_flutter_web/modules/login/user.dart';
import 'package:adama_agropacking_flutter_web/modules/products/presenter/pages/create_products_page.dart';

import 'package:flutter/material.dart';

import 'modules/products/products.dart';
import 'modules/products/presenter/pages/products_page.dart';

void main() {
  ProductsModule.initDependencies();
  UserModule.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adama',
      theme: LightTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/products-list': (context) => const ProductsPage(),
        '/products-create': (context) => const CreateProducts(),
      },
    );
  }
}
