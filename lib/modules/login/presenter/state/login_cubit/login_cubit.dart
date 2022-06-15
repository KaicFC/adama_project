import 'package:adama_agropacking_flutter_web/modules/login/domain/usecases/signin_usecase.dart';
import 'package:adama_agropacking_flutter_web/modules/login/presenter/state/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInUsecase _signIn;

  LoginCubit({required SignInUsecase signIn})
      : _signIn = signIn,
        super(LoginInitialState());

  Future<void> signIn({required String cpf, required String password}) async {
    emit(LoginLoadingState());
    final result = await _signIn(cpf: cpf, password: password);
    result.when(
        success: (data) => emit(LoginSuccessState()),
        failure: (error) => emit(LoginErrorState(error.message)));
  }

  void setLogin({required String cpf, required String password}) async {
    if (cpf.length > 10 && password.length > 3) {
      emit(LoginValidateSuccessState());
    }

    if (password.length <= 3) {
      emit(LoginPasswordErrorState());
    }
    if (cpf.length <= 10) {
      emit(LoginCpfErrorState());
    }
  }
}
