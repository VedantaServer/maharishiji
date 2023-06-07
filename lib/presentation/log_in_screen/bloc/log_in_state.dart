// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

class LogInState extends Equatable {
  LogInState({
    this.emailController,
    this.logInModelObj,
  });

  TextEditingController? emailController;

  LogInModel? logInModelObj;

  @override
  List<Object?> get props => [
        emailController,
        logInModelObj,
      ];
  LogInState copyWith({
    TextEditingController? emailController,
    LogInModel? logInModelObj,
  }) {
    return LogInState(
      emailController: emailController ?? this.emailController,
      logInModelObj: logInModelObj ?? this.logInModelObj,
    );
  }
}
