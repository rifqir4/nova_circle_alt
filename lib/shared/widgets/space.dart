import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceV extends StatelessWidget {
  const SpaceV({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value ?? 16.h);
  }
}

class SpaceH extends StatelessWidget {
  const SpaceH({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value ?? 16.w);
  }
}
