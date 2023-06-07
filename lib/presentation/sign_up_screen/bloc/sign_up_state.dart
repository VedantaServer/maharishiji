// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  SignUpState({
    this.nameController,
    this.emailController,
    this.signUpModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? emailController;

  SignUpModel? signUpModelObj;

  @override
  List<Object?> get props => [
        nameController,
        emailController,
        signUpModelObj,
      ];
  SignUpState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    SignUpModel? signUpModelObj,
  }) {
    return SignUpState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      signUpModelObj: signUpModelObj ?? this.signUpModelObj,
    );
  }
}
