import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/app_nav.dart';
import 'package:nova_circle_alt/core/themes/app_colors.dart';
import 'package:nova_circle_alt/features/explore/city/widgets/city_header.dart';
import 'package:nova_circle_alt/features/explore/city/widgets/city_my_circle_section.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:nova_circle_alt/shared/widgets/widgets.dart';

import '../../../core/utils/app_log.dart';
import 'widgets/city_feature_section.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final ScrollController _scrollController = ScrollController();
  final double collapsedHeight = 300.h;

  late double _appbarHeight;

  bool isIntro = true;
  bool isReachCollapsed = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        final scrollOffset = _scrollController.offset;

        //Intro logic
        if (scrollOffset > 200 && isIntro) {
          setState(() {
            isIntro = false;
          });
        }

        //Colapsed Logic
        final collapsOffset = _appbarHeight - collapsedHeight;
        if (!isReachCollapsed && scrollOffset > collapsOffset) {
          logg.d("Reach collapsed");
          isReachCollapsed = true;
        }

        if (isReachCollapsed && scrollOffset < collapsOffset) {
          _scrollController.jumpTo(collapsOffset);
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appbarHeight = MediaQuery.of(context).size.height - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: ButtonBack(
              foregroundColor: AppColors.white,
              onPressed: () => AppNav.back(),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppSvgs.icShare),
                splashRadius: 20.w,
              ),
            ],
            expandedHeight: _appbarHeight,
            collapsedHeight: collapsedHeight,
            flexibleSpace: CityHeader(isIntro: isIntro),
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
