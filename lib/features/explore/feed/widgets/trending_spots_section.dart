import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/themes.dart';
import '../../../../shared/widgets/widgets.dart';

class TerendingSpotsSection extends StatelessWidget {
  const TerendingSpotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: AppDimension.spotItemRatio,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 20.w),
            itemBuilder: (context, index) {
              return const FeedItem();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 12.h),
      child: Text(
        "Trending Spots Worldwide",
        style: AppTextStyles.subtitle,
      ),
    );
  }
}
