import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/utils/app_global.dart';

import './core/config/flavor_config.dart';
import './core/config/dependency_injection.dart';
import './core/router/app_router.dart';
import './core/router/app_routes.dart';
import 'core/themes/themes.dart';

void main() {
  //Setup flavor environment config
  const flavorConfig = FlavorConfig(
    serverType: Environment.staging,
    apiEndpoint: "https://api.staging.novacircle.com",
    appTitle: "Nova Circle Staging",
    flavorName: "staging",
    bucketUrl: "https://media.staging.novacircle.com",
    dynamicUrl: "https://novacirclestg.page.link",
    appId: "com.mop.novacircle.staging",
    webUrl: "https://web.staging.novacircle.com",
  );

  //Run main common
  mainCommon(flavorConfig);
}

Future<void> mainCommon(FlavorConfig flavorConfig) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      await initFlavorConfig(flavorConfig);
      await initStorage();
      runApp(
        EasyLocalization(
          supportedLocales: const [Locale('en')],
          path: 'assets/localization',
          fallbackLocale: const Locale("en"),
          useFallbackTranslations: true,
          saveLocale: false,
          useOnlyLangCode: true,
          child: const NovaApp(),
        ),
      );
    },
    (error, stack) {
      debugPrint("Error: $error");
    },
  );
}

class NovaApp extends StatelessWidget {
  const NovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, child) => MaterialApp(
        navigatorKey: mainNavigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: di<FlavorConfig>().appTitle,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
        ),
      ),
    );
  }
}
