import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/themes/app_colors.dart';
import 'package:nova_circle_alt/core/utils/app_global.dart';
import 'package:nova_circle_alt/features/explore/city/widgets/city_header.dart';
import 'package:nova_circle_alt/features/explore/city/widgets/city_my_circle_section.dart';
import 'package:nova_circle_alt/shared/widgets/widgets.dart';

import 'widgets/city_feature_section.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: ButtonBack(
              foregroundColor: AppColors.white,
              onPressed: () => exploreNavigatorKey.currentState?.pop(),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: const CityHeader(),
            collapsedHeight: 200.h,
          ),

          //My circle
          const SliverToBoxAdapter(
            child: CityMyCircleSection(),
          ),

          const SliverToBoxAdapter(
            child: CityFeatureSection(),
          ),

          //My circle
          SliverToBoxAdapter(
            child: SpaceV(value: 20.h),
          ),
        ],
      ),
    );
  }
}
