// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

class LogInState extends Equatable {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  LogInState({
    this.emailController,
    this.passwordController,
    this.logInModelObj,
  });

  LogInModel? logInModelObj;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        logInModelObj,
      ];
  LogInState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    LogInModel? logInModelObj,
  }) {
    return LogInState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      logInModelObj: logInModelObj ?? this.logInModelObj,
    );
  }
}
