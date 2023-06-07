import 'bloc/compose_bloc.dart';
import 'models/compose_model.dart';
import 'package:flutter/material.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_button.dart';

class ComposeScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ComposeBloc>(
      create: (context) => ComposeBloc(ComposeState(
        composeModelObj: ComposeModel(),
      ))
        ..add(ComposeInitialEvent()),
      child: ComposeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComposeBloc, ComposeState>(
      builder: (context, state) {
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
                      text: "lbl_compose".tr,
                      margin: getMargin(
                        left: 66,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              width: double.maxFinite,
              padding: getPadding(
                left: 16,
                top: 34,
                right: 16,
                bottom: 34,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "msg_compose_your_message".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterMedium16Gray400,
                  ),
                  Spacer(),
                  CustomButton(
                    height: getVerticalSize(
                      51,
                    ),
                    text: "lbl_send".tr,
                    margin: getMargin(
                      bottom: 272,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
