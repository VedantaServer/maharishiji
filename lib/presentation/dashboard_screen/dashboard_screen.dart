import '../dashboard_screen/widgets/dashboard_item_widget.dart';
import 'bloc/dashboard_bloc.dart';
import 'models/dashboard_model.dart';
import 'models/dashboard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class DashboardScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ContentBloc>(
      create: (context) => ContentBloc(ContentState(
        contentModelObj: ContentModel(),
      ))
        ..add(ContentInitialEvent()),
      child: DashboardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: ColorConstant.orange300,
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
                AppbarSubtitle(
                  text: 'Welcome..',
                  margin: getMargin(
                    left: 76,
                  ),
                ),
              ],
            ),
          ),
        ),
        body:
    ClipPath(
    clipper: CustomShapeClipper(),
      child:Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocSelector<ContentBloc, ContentState, TextEditingController?>(
                selector: (state) => state.searchController,
                builder: (context, searchController) {
                  return CustomTextFormField(
                    //focusNode: FocusNode(),
                   // autofocus: true,
                    controller: searchController,
                    hintText: "lbl_search".tr,
                    margin: getMargin(
                      left: 16,
                      top: 21,
                      right: 16,
                    ),
                    variant: TextFormFieldVariant.OutlineGray20001,
                    fontStyle: TextFormFieldFontStyle.InterMedium16,
                  );
                },
              ),
              Container(
                height: getVerticalSize(
                  600,
                ),
                width: double.maxFinite,
                margin: getMargin(
                  top: 16,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          left: 16,
                          right: 16,
                        ),
                        child: BlocSelector<ContentBloc, ContentState,
                            ContentModel?>(
                          selector: (state) => state.contentModelObj,
                          builder: (context, contentModelObj) {
                            return ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (
                                context,
                                index,
                              ) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    16,
                                  ),
                                );
                              },
                              itemCount: contentModelObj
                                      ?.contentblocksItemList.length ??
                                  0,
                              itemBuilder: (context, index) {
                                ContentblocksItemModel model = contentModelObj
                                        ?.contentblocksItemList[index] ??
                                    ContentblocksItemModel();
                                return ContentblocksItemWidget(
                                  model,
                                );
                              },
                            );
                          },
                        ),
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
class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 100); // Start from the bottom-left corner
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100); // Draw a curve to the bottom-right corner
    path.lineTo(size.width, 0); // Draw a line to the top-right corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


