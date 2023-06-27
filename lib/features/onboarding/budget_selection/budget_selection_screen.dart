import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/features/onboarding/budget_selection/widgets/select_budget.dart';

import '../../../core/themes/themes.dart';
import '../../../shared/widgets/widgets.dart';

class BudgetSelectionScreen extends StatelessWidget {
  const BudgetSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
              child: Column(
                children: [
                  _buildHeader(),
                  SpaceV(value: 25.h),
                  const SelectBudget(),
                  const Spacer(),
                  Button(
                      title: "Continue",
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.home, (route) => false);
                      }),
                  SpaceV(value: 30.h),
                ],
              ))),
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
            child: Text("What is your style of travel?",
                style: AppTextStyles.body1Bold.copyWith(
                  color: AppColors.greyDarkest,
                ))),
        Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Text(
                "This can later be changed in the account settings at any time.",
                style: AppTextStyles.body2)),
      ],
    );
  }
}
