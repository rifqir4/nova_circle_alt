import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/themes/themes.dart';
import '../../../core/utils/app_botsheet.dart';
import '../../../core/utils/app_global.dart';
import '../../../shared/resources/app_svgs.dart';
import '../../../shared/widgets/widgets.dart';

class VisitedListScreen extends StatelessWidget {
  const VisitedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "Spot I Visited",
        leading: ButtonBack(
          onPressed: () => listsNavigatorKey.currentState?.pop(),
        ),
        actions: [
          IconButton(
            splashRadius: 20.w,
            icon: SvgPicture.asset(AppSvgs.icLock),
            onPressed: () {
              AppBotsheet.publicity();
            },
          ),
        ],
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
              itemCount: 7,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: AppDimension.spotItemRatio,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.w),
              itemBuilder: (context, index) {
                return const SpotItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
