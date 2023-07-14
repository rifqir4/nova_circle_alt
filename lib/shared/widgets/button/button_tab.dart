import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/themes.dart';

class ButtonTabData {
  final String id;
  final String title;

  ButtonTabData({required this.id, required this.title});
}

class ButtonTab extends StatefulWidget {
  const ButtonTab({super.key, required this.list, this.onChange});

  final List<ButtonTabData> list;
  final Function(int)? onChange;

  @override
  State<ButtonTab> createState() => _ButtonTabState();
}

class _ButtonTabState extends State<ButtonTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final list = widget.list;
    final totalItem = list.length;

    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: totalItem,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: totalItem,
        mainAxisExtent: 40.w,
        crossAxisSpacing: 8.w,
      ),
      itemBuilder: (context, index) {
        return _buildButton(
          isActive: index == selectedIndex,
          title: list[index].title,
          onPressed: () {
            setState(() => selectedIndex = index);
            widget.onChange?.call(selectedIndex);
          },
        );
      },
    );
  }

  Widget _buildButton(
      {required String title,
      bool isActive = false,
      required VoidCallback onPressed}) {
    final bgColor = isActive ? AppColors.blueSky : Colors.transparent;
    final fgColor = isActive ? AppColors.white : AppColors.blueSky;

    return SizedBox(
      width: double.infinity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: bgColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(title,
                  style: AppTextStyles.body3Bold.copyWith(color: fgColor)),
            ),
          ),
        ),
      ),
    );
  }
}
