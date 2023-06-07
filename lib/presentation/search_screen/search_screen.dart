import 'bloc/search_bloc.dart';
import 'models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SearchScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(SearchState(
        searchModelObj: SearchModel(),
      ))
        ..add(SearchInitialEvent()),
      child: SearchScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(
            62,
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
                    top: 7,
                    bottom: 9,
                  ),
                ),
                AppbarSubtitle(
                  text: "lbl_content".tr,
                  margin: getMargin(
                    left: 76,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            AppbarSubtitle2(
              text: "lbl_filter".tr,
              margin: getMargin(
                left: 16,
                top: 16,
                right: 16,
                bottom: 19,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 21,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocSelector<SearchBloc, SearchState, TextEditingController?>(
                  selector: (state) => state.searchController,
                  builder: (context, searchController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: searchController,
                      hintText: "lbl_search".tr,
                      margin: getMargin(
                        left: 16,
                        right: 16,
                      ),
                      variant: TextFormFieldVariant.OutlineGray20001,
                      fontStyle: TextFormFieldFontStyle.InterMedium16,
                    );
                  },
                ),
                BlocSelector<SearchBloc, SearchState, TextEditingController?>(
                  selector: (state) => state.searchoneController,
                  builder: (context, searchoneController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: searchoneController,
                      hintText: "lbl_search_result".tr,
                      margin: getMargin(
                        left: 33,
                        top: 31,
                        right: 16,
                      ),
                    );
                  },
                ),
                BlocSelector<SearchBloc, SearchState, TextEditingController?>(
                  selector: (state) => state.searchtwoController,
                  builder: (context, searchtwoController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: searchtwoController,
                      hintText: "lbl_search_result".tr,
                      margin: getMargin(
                        left: 33,
                        top: 14,
                        right: 16,
                      ),
                    );
                  },
                ),
                BlocSelector<SearchBloc, SearchState, TextEditingController?>(
                  selector: (state) => state.searchthreeController,
                  builder: (context, searchthreeController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: searchthreeController,
                      hintText: "lbl_search_result".tr,
                      margin: getMargin(
                        left: 33,
                        top: 14,
                        right: 16,
                      ),
                    );
                  },
                ),
                BlocSelector<SearchBloc, SearchState, TextEditingController?>(
                  selector: (state) => state.searchfourController,
                  builder: (context, searchfourController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: searchfourController,
                      hintText: "lbl_search_result".tr,
                      margin: getMargin(
                        left: 33,
                        top: 14,
                        right: 16,
                      ),
                    );
                  },
                ),
                BlocSelector<SearchBloc, SearchState, TextEditingController?>(
                  selector: (state) => state.searchfiveController,
                  builder: (context, searchfiveController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: searchfiveController,
                      hintText: "lbl_search_result".tr,
                      margin: getMargin(
                        left: 33,
                        top: 14,
                        right: 16,
                      ),
                    );
                  },
                ),
                BlocSelector<SearchBloc, SearchState, TextEditingController?>(
                  selector: (state) => state.searchsixController,
                  builder: (context, searchsixController) {
                    return CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: searchsixController,
                      hintText: "lbl_search_result".tr,
                      margin: getMargin(
                        left: 33,
                        top: 14,
                        right: 16,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: getPadding(
                    top: 240,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(
                        height: getVerticalSize(
                          1,
                        ),
                        thickness: getVerticalSize(
                          1,
                        ),
                        color: ColorConstant.blueGray200,
                      ),
                      Container(
                        height: getVerticalSize(
                          83,
                        ),
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: getVerticalSize(
                                  83,
                                ),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray50,
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 14,
                              ),
                              child: BlocSelector<SearchBloc, SearchState,
                                  TextEditingController?>(
                                selector: (state) => state.otpController,
                                builder: (context, otpController) {
                                  return PinCodeTextField(
                                    appContext: context,
                                    controller: otpController,
                                    length: 5,
                                    obscureText: false,
                                    obscuringCharacter: '*',
                                    keyboardType: TextInputType.number,
                                    autoDismissKeyboard: true,
                                    enableActiveFill: true,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onChanged: (value) {
                                      otpController?.text = value;
                                    },
                                    pinTheme: PinTheme(
                                      fieldHeight: getHorizontalSize(
                                        32,
                                      ),
                                      fieldWidth: getHorizontalSize(
                                        32,
                                      ),
                                      shape: PinCodeFieldShape.circle,
                                      selectedFillColor: ColorConstant.green400,
                                      activeFillColor: ColorConstant.green400,
                                      inactiveFillColor: ColorConstant.green400,
                                      inactiveColor:
                                          ColorConstant.fromHex("#1212121D"),
                                      selectedColor:
                                          ColorConstant.fromHex("#1212121D"),
                                      activeColor:
                                          ColorConstant.fromHex("#1212121D"),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
