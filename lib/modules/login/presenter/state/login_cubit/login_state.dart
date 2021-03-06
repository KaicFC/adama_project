import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginCpfErrorState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginPasswordErrorState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginValidateSuccessState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
