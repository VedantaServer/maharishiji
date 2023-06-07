import '../expenses_screen/widgets/bars_item_widget.dart';
import '../expenses_screen/widgets/listicon_item_widget.dart';
import 'bloc/expenses_bloc.dart';
import 'models/bars_item_model.dart';
import 'models/expenses_model.dart';
import 'models/listicon_item_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';

class ExpensesScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ExpensesBloc>(
      create: (context) => ExpensesBloc(ExpensesState(
        expensesModelObj: ExpensesModel(),
      ))
        ..add(ExpensesInitialEvent()),
      child: ExpensesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            65,
          ),
          title: Padding(
            padding: getPadding(
              left: 16,
            ),
            child: Row(
              children: [
                AppbarSubtitle2(
                  text: "lbl_back".tr,
                  margin: getMargin(
                    top: 4,
                    bottom: 12,
                  ),
                ),
                AppbarSubtitle(
                  text: "lbl_expenses".tr,
                  margin: getMargin(
                    left: 65,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            AppbarSubtitle2(
              text: "lbl_new".tr,
              margin: getMargin(
                left: 16,
                top: 14,
                right: 16,
                bottom: 21,
              ),
            ),
          ],
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 16,
            top: 18,
            right: 16,
            bottom: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                child: Container(
                  padding: getPadding(
                    left: 19,
                    top: 16,
                    right: 19,
                    bottom: 16,
                  ),
                  decoration: AppDecoration.outlineGray20001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: getVerticalSize(
                          199,
                        ),
                        child: BlocSelector<ExpensesBloc, ExpensesState,
                            ExpensesModel?>(
                          selector: (state) => state.expensesModelObj,
                          builder: (context, expensesModelObj) {
                            return ListView.separated(
                              padding: getPadding(
                                right: 3,
                                bottom: 9,
                              ),
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (
                                context,
                                index,
                              ) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    19,
                                  ),
                                );
                              },
                              itemCount:
                                  expensesModelObj?.barsItemList.length ?? 0,
                              itemBuilder: (context, index) {
                                BarsItemModel model =
                                    expensesModelObj?.barsItemList[index] ??
                                        BarsItemModel();
                                return BarsItemWidget(
                                  model,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 32,
                ),
                child: Text(
                  "lbl_expenses".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterMedium24,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 28,
                ),
                child:
                    BlocSelector<ExpensesBloc, ExpensesState, ExpensesModel?>(
                  selector: (state) => state.expensesModelObj,
                  builder: (context, expensesModelObj) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return SizedBox(
                          height: getVerticalSize(
                            14,
                          ),
                        );
                      },
                      itemCount: expensesModelObj?.listiconItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        ListiconItemModel model =
                            expensesModelObj?.listiconItemList[index] ??
                                ListiconItemModel();
                        return ListiconItemWidget(
                          model,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
