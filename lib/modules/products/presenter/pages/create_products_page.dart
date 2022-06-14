import 'package:adama_agropacking_flutter_web/core/services/injection/dependency_injection_service.dart';
import 'package:adama_agropacking_flutter_web/core/widgets/buttons/button.dart';
import 'package:adama_agropacking_flutter_web/core/widgets/input/input.dart';
import 'package:adama_agropacking_flutter_web/core/widgets/input/selector_input.dart';
import 'package:adama_agropacking_flutter_web/core/widgets/widgets.dart';
import 'package:adama_agropacking_flutter_web/modules/products/domain/use_cases/create_product_use_case.dart';
import 'package:adama_agropacking_flutter_web/modules/products/presenter/state/create_product_cubit/create_product_cubit.dart';
import 'package:adama_agropacking_flutter_web/modules/products/presenter/state/create_product_cubit/create_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/text/styled_text.dart';

class CreateProducts extends StatefulWidget {
  const CreateProducts({Key? key}) : super(key: key);

  @override
  State<CreateProducts> createState() => _CreateProductsState();
}

class _CreateProductsState extends State<CreateProducts> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        username: 'Nome do usuário',
      ),
      body: Row(
        children: [
          const Menu(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              child: BlocProvider(
                create: (context) => CreateProductCubit(
                  createProduct: Dependency.get<CreateProductUseCase>(),
                ),
                child: BlocConsumer<CreateProductCubit, CreateProductState>(
                  listener: (context, state) {},
                  buildWhen: (previous, current) {
                    return previous.status != current.status;
                  },
                  builder: (context, state) {
                    final cubit = context.read<CreateProductCubit>();
                    if (state.status == CreateProductStatus.loading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }

                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleText('Cadastrar Produto'),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 30,
                                horizontal: 40,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).cardColor,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Input(
                                      placeholder: 'PRODUTO',
                                      hint: 'Digite o nome do produto',
                                      emptyErrorText: 'Campo obrigatório',
                                      onSaved: (content) {
                                        cubit.save((data) =>
                                            data.copyWith(name: content));
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    Input(
                                      placeholder: 'CÓDIGO SAP',
                                      hint: 'Digite o código SAP do produto',
                                      emptyErrorText: 'Campo obrigatório',
                                      onSaved: (content) {
                                        cubit.save((data) =>
                                            data.copyWith(sapCode: content));
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    SelectorInput(
                                      placeholder: 'TIPO DE PRODUTO',
                                      hint: 'Selecionar',
                                      emptyErrorText: 'Selecione um item',
                                      onSaved: (content) {
                                        cubit.save(
                                          (data) => data.copyWith(
                                            classification: content,
                                          ),
                                        );
                                      },
                                      items: [
                                        "Herbicida",
                                        "Item 02",
                                        "Item 03",
                                        'Item 04',
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Input(
                                      placeholder: 'LINK DO SITE',
                                      hint: 'Digite a url da página do produto',
                                      emptyErrorText: 'Campo obrigatório',
                                      onSaved: (content) {
                                        cubit.save((data) =>
                                            data.copyWith(siteUrl: content));
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    Input(
                                      placeholder: 'IMAGEM DE EXIBIÇÃO',
                                      hint: 'Digite a url da imagem',
                                      emptyErrorText: 'Campo obrigatório',
                                      onSaved: (content) {
                                        cubit.save((data) =>
                                            data.copyWith(imageUrl: content));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Button.secondary(
                                  text: 'Cancelar',
                                  onPressed: () {
                                    //Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: 150,
                                child: Button(
                                  text: 'Salvar',
                                  onPressed: () async {
                                    if (_formKey.currentState != null &&
                                        _formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      await cubit.createProduct();
                                      if (state.status ==
                                          CreateProductStatus.success) {
                                        //Navigator.of(context).pop();
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
