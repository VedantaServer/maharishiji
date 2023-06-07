import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/bars_item_model.dart';
import '../models/listicon_item_model.dart';
import 'package:maharishiji/presentation/expenses_screen/models/expenses_model.dart';
part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  ExpensesBloc(ExpensesState initialState) : super(initialState) {
    on<ExpensesInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ExpensesInitialEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(state.copyWith(
        expensesModelObj: state.expensesModelObj?.copyWith(
      barsItemList: fillBarsItemList(),
      listiconItemList: fillListiconItemList(),
    )));
  }

  List<BarsItemModel> fillBarsItemList() {
    return List.generate(8, (index) => BarsItemModel());
  }

  List<ListiconItemModel> fillListiconItemList() {
    return List.generate(6, (index) => ListiconItemModel());
  }
}
