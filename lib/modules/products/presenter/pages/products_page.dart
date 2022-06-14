import 'package:adama_agropacking_flutter_web/core/services/injection/dependency_injection_service.dart';
import 'package:adama_agropacking_flutter_web/modules/products/domain/use_cases/get_products_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/widgets.dart';
import '../state/products_cubit/products_cubit.dart';
import '../widgets/products/body_products_widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ListProductsState();
}

class _ListProductsState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        username: 'Nome do usuário',
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Menu(),
          Expanded(
            child: Container(
              color: const Color(0xffDADADA),
              child: BlocProvider(
                create: (context) => ProductsCubit(
                  getProductsUseCase: Dependency.get<GetProductsUseCase>(),
                )..getProducts(),
                child: const BodyProductsWidgetWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
