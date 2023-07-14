import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/core/utils/app_global.dart';
import 'package:nova_circle_alt/shared/widgets/widgets.dart';

class CircleListScreen extends StatelessWidget {
  const CircleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "My Circle List",
        leading: ButtonBack(
          onPressed: () => exploreNavigatorKey.currentState?.pop(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          //Search
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
              child: InputSearch(controller: TextEditingController()),
            ),
          ),

          //Lists
          SliverToBoxAdapter(
            child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(
                top: 12.h,
                left: AppDimension.paddingScreen,
                right: AppDimension.paddingScreen,
                bottom: 20.h,
              ),
              itemCount: 11,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: AppDimension.feedItemRatio,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.w),
              itemBuilder: (context, index) {
                return const FeedItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
