import 'package:flutter/material.dart';
import 'package:nova_circle_alt/core/themes/app_colors.dart';
import 'package:nova_circle_alt/core/utils/app_global.dart';
import 'package:nova_circle_alt/shared/widgets/botsheet/botsheet_follow_in_city.dart';
import 'package:nova_circle_alt/shared/widgets/botsheet/botsheet_template.dart';

class AppBotsheet {
  AppBotsheet._();

  static final BuildContext? context = mainNavigatorKey.currentContext;

  static void close() {
    if (context == null) throw "context not found";
    Navigator.pop(context!);
  }

  static Future<T?> showBottomSheet<T>({required Widget widget}) {
    if (context == null) throw "context not found";
    return showModalBottomSheet(
      context: context!,
      isScrollControlled: true,
      barrierColor: AppColors.blueSky.withOpacity(0.75),
      backgroundColor: Colors.transparent,
      builder: (context) => BotsheetTemplate(child: widget),
    );
  }

  static followInCity() {
    return showBottomSheet(widget: const BotsheetFollowInCity());
  }
}
