// ignore_for_file: must_be_immutable

part of 'radios_bloc.dart';

class RadiosState extends Equatable {
  RadiosState({
    this.radioselectedController,
    this.grouptwentyseveController,
    this.radioselectedController1,
    this.groupthirtyoneController,
    this.groupthirtythreController,
    this.radioselectedController2,
    this.otpController,
    this.radiosModelObj,
  });

  TextEditingController? radioselectedController;

  TextEditingController? grouptwentyseveController;

  TextEditingController? radioselectedController1;

  TextEditingController? groupthirtyoneController;

  TextEditingController? groupthirtythreController;

  TextEditingController? radioselectedController2;

  TextEditingController? otpController;

  RadiosModel? radiosModelObj;

  @override
  List<Object?> get props => [
        radioselectedController,
        grouptwentyseveController,
        radioselectedController1,
        groupthirtyoneController,
        groupthirtythreController,
        radioselectedController2,
        otpController,
        radiosModelObj,
      ];
  RadiosState copyWith({
    TextEditingController? radioselectedController,
    TextEditingController? grouptwentyseveController,
    TextEditingController? radioselectedController1,
    TextEditingController? groupthirtyoneController,
    TextEditingController? groupthirtythreController,
    TextEditingController? radioselectedController2,
    TextEditingController? otpController,
    RadiosModel? radiosModelObj,
  }) {
    return RadiosState(
      radioselectedController:
          radioselectedController ?? this.radioselectedController,
      grouptwentyseveController:
          grouptwentyseveController ?? this.grouptwentyseveController,
      radioselectedController1:
          radioselectedController1 ?? this.radioselectedController1,
      groupthirtyoneController:
          groupthirtyoneController ?? this.groupthirtyoneController,
      groupthirtythreController:
          groupthirtythreController ?? this.groupthirtythreController,
      radioselectedController2:
          radioselectedController2 ?? this.radioselectedController2,
      otpController: otpController ?? this.otpController,
      radiosModelObj: radiosModelObj ?? this.radiosModelObj,
    );
  }
}
