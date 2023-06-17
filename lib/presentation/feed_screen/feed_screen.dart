import '../feed_screen/widgets/feed_item_widget.dart';
import 'bloc/feed_bloc.dart';
import 'models/feed_item_model.dart';
import 'models/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maharishiji/core/app_export.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle.dart';
import 'package:maharishiji/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:maharishiji/widgets/app_bar/custom_app_bar.dart';
import 'package:maharishiji/widgets/custom_text_form_field.dart';


class FeedScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<FeedBloc>(
      create: (context) => FeedBloc(FeedState(feedModelObj: FeedModel(),))..add(FeedInitialEvent()),
      child: FeedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.blueAccent,
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
                    onTap:() {
                    Navigator.pop(context,true);
                    }
                ),
                AppbarSubtitle(
                  text: "lbl_feed".tr,
                  margin: getMargin(
                    left: 20,
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
                BlocSelector<FeedBloc, FeedState, TextEditingController?>(
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
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 15,
                    right: 16,
                  ),
                  child: BlocSelector<FeedBloc, FeedState, FeedModel?>(
                    selector: (state) => state.feedModelObj,
                    builder: (context, feedModelObj) {
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
                        itemCount: feedModelObj?.feedItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          FeedItemModel model =
                              feedModelObj?.feedItemList[index] ??
                                  FeedItemModel();
                          return FeedItemWidget(
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
      ),
    );
  }
}
