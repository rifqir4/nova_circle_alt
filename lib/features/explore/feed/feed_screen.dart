import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/features/explore/feed/widgets/feature_section.dart';
import 'package:nova_circle_alt/features/explore/feed/widgets/my_circle_section.dart';
import 'package:nova_circle_alt/features/explore/feed/widgets/trending_spots_section.dart';

import '../../../core/router/router.dart';
import '../../../core/themes/themes.dart';
import '../../../shared/widgets/widgets.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager().primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              //Search
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingScreen),
                  child: InputSearch(controller: TextEditingController()),
                ),
              ),

              //City list
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingScreen),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 56.w / 132.w,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 8.w),
                    itemBuilder: (context, index) {
                      return CityItem(
                        onTap: () {
                          // showGeneralDialog(
                          //     context: context,
                          //     barrierColor: Colors.transparent,
                          //     barrierDismissible: false,
                          //     transitionDuration:
                          //         const Duration(milliseconds: 250),
                          //     pageBuilder: (ctx, _, __) => const CityIntro());

                          //     Navigator.pushNamed(context, routeName)

                          AppNav.push(AppRoutes.cityScreen);
                        },
                      );
                    },
                  ),
                ),
              ),

              //My Circle
              const SliverToBoxAdapter(child: MyCircleSection()),

              //Trending Spots Worldwide
              const SliverToBoxAdapter(child: TerendingSpotsSection()),

              //Feature Section
              const SliverToBoxAdapter(child: FeatureSection()),

              //Bottom Space
              SliverToBoxAdapter(child: SpaceV(value: 20.h)),
            ],
          ),
        ),
      ),
    );
  }
}
