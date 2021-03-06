import 'package:adama_agropacking_flutter_web/core/services/injection/dependency_injection_service.dart';
import 'package:adama_agropacking_flutter_web/modules/login/domain/usecases/signin_usecase.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/pages/constrains.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/pages/login_page.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/state/login_cubit/login_cubit.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/state/login_cubit/login_state.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/widgets/CardLogo.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/widgets/cardForgotPassword.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/widgets/customForm.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardFormLogin extends StatefulWidget {
  final double height, width;
  const CardFormLogin({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<CardFormLogin> createState() => _CardFormLoginState();
}

class _CardFormLoginState extends State<CardFormLogin> {
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    cpfController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  validator(LoginState state) {}

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(signIn: Dependency.get<SignInUsecase>()),
      child: Padding(
        padding: Constants.cardFormularioPadding(widget.height, widget.width),
        child: Column(
          crossAxisAlignment: Constants.cardFormularioColumnCrossAxis(
              widget.height, widget.width),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardLogo(height: widget.height, width: widget.width),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: widget.height < 370
                              ? EdgeInsets.all(10)
                              : EdgeInsets.all(25),
                          child: Column(
                            children: [
                              FormTitle(
                                height: widget.height,
                                width: widget.width,
                              ),
                              BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  return CustomForm(
                                    title: 'Usu??rio',
                                    hintText: '444.333.222-11',
                                    obscureText: false,
                                    height: widget.height,
                                    width: widget.width,
                                    controller: cpfController,
                                    formatter: CpfInputFormatter(),
                                    onChanged: (text) {
                                      context.read<LoginCubit>().setLogin(
                                          cpf: cpfController.text,
                                          password: passwordController.text);
                                    },
                                    validator: (text) {
                                      if (state is LoginCpfErrorState) {
                                        return 'CPF inv??lido';
                                      }
                                      if (state is LoginValidateSuccessState) {
                                        return null;
                                      }
                                    },
                                  );
                                },
                              ),
                              BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  return CustomForm(
                                      title: 'Senha',
                                      hintText: '************',
                                      obscureText: true,
                                      height: widget.height,
                                      width: widget.width,
                                      controller: passwordController,
                                      formatter:
                                          FilteringTextInputFormatter.deny(
                                              'filterPattern'),
                                      onChanged: (text) {
                                        context.read<LoginCubit>().setLogin(
                                            cpf: cpfController.text,
                                            password: passwordController.text);
                                      },
                                      validator: (text) {
                                        if (state is LoginPasswordErrorState) {
                                          return 'Senha inv??lida';
                                        }
                                        if (state
                                            is LoginValidateSuccessState) {
                                          return null;
                                        }
                                      });
                                },
                              ),
                              CardForgotPassword(
                                  height: widget.height, width: widget.width),
                              BlocConsumer<LoginCubit, LoginState>(
                                  listener: (context, state) {
                                if (state is LoginSuccessState) {
                                  Navigator.of(context)
                                      .pushNamed('/products-list');
                                } else if (state is LoginErrorState) {
                                  // Fazer container dados.

                                }
                              }, builder: (context, state) {
                                if (state is LoginLoadingState) {
                                  return CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor);
                                }
                                return ButtomEntrar(
                                  height: widget.height,
                                  width: widget.width,
                                  onTap: () {
                                    context.read<LoginCubit>().signIn(
                                        cpf: cpfController.text,
                                        password: passwordController.text);
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
