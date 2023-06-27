import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/shared/widgets/widgets.dart';

class SelectBudget extends StatefulWidget {
  const SelectBudget({super.key});

  @override
  State<SelectBudget> createState() => _SelectBudgetState();
}

class _SelectBudgetState extends State<SelectBudget> {
  int? selected;

  final listPrice = [
    {'name': 'Luxury', 'price': 4},
    {'name': 'Premium', 'price': 3},
    {'name': 'Budget', 'price': 2},
    {'name': 'Backpacker', 'price': 1}
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: listPrice.length,
        itemBuilder: (context, idx) {
          final item = listPrice[idx];
          final name = item['name'] as String;
          final price = item['price'] as int;

          return GestureDetector(
            onTap: () => setState(() => selected = idx),
            child: _buildItem(
                name: name, price: price, isSelected: selected == idx),
          );
        });
  }

  Widget _buildItem(
      {required String name, required int price, bool isSelected = false}) {
    //Changes value
    final cardColor = isSelected ? AppColors.blueSky : AppColors.white;
    final nameColor = isSelected ? AppColors.white : AppColors.greyDarkest;
    final dollarColor = isSelected ? AppColors.white : AppColors.greyDarker;

    //Generate Dollars
    final dollars = StringBuffer();
    for (var i = 0; i < price; i++) {
      dollars.write("\$");
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(name, style: AppTextStyles.body2Bold.copyWith(color: nameColor)),
        SpaceV(value: 6.h),
        Text(
          dollars.toString(),
          style: AppTextStyles.body3.copyWith(color: dollarColor),
        ),
      ]),
    );
  }
}
