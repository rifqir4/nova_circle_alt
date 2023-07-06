import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/themes/themes.dart';
import '../../../shared/widgets/widgets.dart';

class ContentPreferScreen extends StatelessWidget {
  const ContentPreferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UnfocusWrap(
        child: SafeArea(
          top: true,
          bottom: false,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.paddingScreen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    childAspectRatio: 56 / 117,
                                    crossAxisSpacing: 12.w,
                                    mainAxisSpacing: 8.w),
                            itemBuilder: (context, idx) =>
                                CityItem(isSelected: idx % 2 == 0))),
                  ],
                ),
              ),

              //Footer
              Positioned.fill(child: _buildFooter(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: 12.h,
            ),
            child: Text("What cities are you excited about?",
                style: AppTextStyles.body1Bold.copyWith(
                  color: AppColors.greyDarkest,
                ))),
        Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Text(
                "These can be the places you are interested to visit or have already visited.",
                style: AppTextStyles.body2)),
        InputSearch(controller: TextEditingController()),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          //Backdrop Glass
          Container(
            clipBehavior: Clip.antiAlias,
            height: 95.h,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(color: Colors.white.withOpacity(0.25)),
            ),
          ),

          //Button List
          Positioned.fill(
              child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Button(
                    title: "Continue",
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.budgetSelection);
                    }),
                SpaceV(value: 50.h),
              ],
            )),
          ))
        ],
      ),
    );
  }
}
