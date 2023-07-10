import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/features/onboarding/contact_sync/widgets/contact_card.dart';
import 'package:nova_circle_alt/features/onboarding/contact_sync/widgets/selected_user_section.dart';

import '../../../shared/widgets/widgets.dart';

class ContactSyncScreen extends StatelessWidget {
  const ContactSyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          bottom: false,
          child: Stack(children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SpaceV(value: 20.h)),
                  //Discover selected user
                  const SliverToBoxAdapter(child: SelectedUserSection()),

                  //Contact header
                  SliverToBoxAdapter(child: _buildHeader()),

                  //Registered Contact
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 50.w),
                          child: Text(
                              "Start building your circle with people you know...",
                              style: AppTextStyles.body2),
                        ),
                        const SpaceV(),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          primary: false,
                          itemCount: 3,
                          itemBuilder: (_, idx) => const ContactCard(),
                        )
                      ],
                    ),
                  ),

                  //Unregistered Contact
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SpaceV(value: 20.h),
                        Padding(
                          padding: EdgeInsets.only(right: 50.w),
                          child: Text("…and invite your other contacts.",
                              style: AppTextStyles.body2),
                        ),
                        SpaceV(value: 24.h),
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: 3,
                          itemBuilder: (_, idx) => const ContactCard(),
                        )
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SpaceV(value: 120.h)),
                ],
              ),
            ),
            Positioned.fill(child: _buildFooter(context))
          ])),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(
        top: 40.h,
        bottom: 12.h,
      ),
      child: Text("Members of your gang are already here!",
          style: AppTextStyles.body1Bold.copyWith(
            color: AppColors.greyDarkest,
          )),
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
            height: 125.h,
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
                Button(title: "Continue", onPressed: () {}),
                SpaceV(value: 5.h),
                ButtonText(
                    title: "Skip for now",
                    textStyle: AppTextStyles.body2Bold
                        .copyWith(color: AppColors.blueSky),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.contentPrefer);
                    }),
                SpaceV(value: 30.h)
              ],
            )),
          ))
        ],
      ),
    );
  }
}
