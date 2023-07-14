import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_circle_alt/features/lists/add_new_list/add_new_list_screen.dart';
import 'package:nova_circle_alt/features/onboarding/budget_selection/budget_selection_screen.dart';

import '../../features/onboarding/agreement/agreement_screen.dart';
import '../../features/auth/auth_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/intro/intro_screen.dart';
import '../../features/onboarding/contact_permission/contact_permission_screen.dart';
import '../../features/onboarding/contact_sync/contact_sync_screen.dart';
import '../../features/onboarding/content_prefer/content_prefer_screen.dart';
import '../../features/onboarding/verify_otp/verify_otp_cubit.dart';
import '../../features/onboarding/verify_otp/verify_otp_screen.dart';
import '../../features/onboarding/verify_phone/presentation/verify_phone_cubit.dart';
import '../../features/onboarding/verify_phone/presentation/verify_phone_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../shared/screens/error_404_screen.dart';
import '../../shared/screens/no_internet_screen.dart';
import '../../shared/screens/undefined_route_screen.dart';

class AppScreens {
  AppScreens._();

  static Route<dynamic> undefined(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (_) =>
            UndefinedRouteScreen(routeName: settings.name.toString()));
  }

  static Route<dynamic> noInternet(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const NoInternetScreen());
  }

  static Route<dynamic> error404(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const Error404Screen());
  }

  static Route<dynamic> splash() {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }

  static Route<dynamic> intro() {
    return MaterialPageRoute(builder: (_) => const IntroScreen());
  }

  //AUTH
  static Route<dynamic> auth() {
    return MaterialPageRoute(builder: (_) => const AuthScreen());
  }

  //OnBoarding
  static Route<dynamic> agreement() {
    return MaterialPageRoute(builder: (_) => const AgreementScreen());
  }

  static Route<dynamic> verifyPhone() {
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (context) => VerifyPhoneCubit(),
            child: const VerifyPhoneScreen()));
  }

  static Route<dynamic> verifyOtp() {
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (context) => VerifyOtpCubit(),
            child: const VerifyOtpScreen()));
  }

  static Route<dynamic> contactPermission() {
    return MaterialPageRoute(builder: (_) => const ContactPermissionScreen());
  }

  static Route<dynamic> contactSync() {
    return MaterialPageRoute(builder: (_) => const ContactSyncScreen());
  }

  static Route<dynamic> contentPreffer() {
    return MaterialPageRoute(builder: (_) => const ContentPreferScreen());
  }

  static Route<dynamic> budgetSelection() {
    return MaterialPageRoute(builder: (_) => const BudgetSelectionScreen());
  }

  static Route<dynamic> home(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }

  static Route<dynamic> addNewList(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const AddNewListScreen());
  }
}
