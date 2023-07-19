import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_circle_alt/features/discover/get_inspired/get_inspired_screen.dart';
import 'package:nova_circle_alt/features/discover/preview/preview_screen.dart';
import 'package:nova_circle_alt/features/profile/user_edit/user_edit_screen.dart';
import 'package:nova_circle_alt/features/profile/user_settings/user_settings_screen.dart';

import '../../features/auth/auth_screen.dart';
import '../../features/explore/circle_list/circle_list_screen.dart';
import '../../features/explore/city/city_screen.dart';
import '../../features/explore/feed/feed_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/intro/intro_screen.dart';
import '../../features/lists/add_new_list/add_new_list_screen.dart';
import '../../features/lists/my_list/my_lists_screen.dart';
import '../../features/lists/visited_list/visited_list.dart';
import '../../features/lists/wish_list/wish_list_screen.dart';
import '../../features/onboarding/agreement/agreement_screen.dart';
import '../../features/onboarding/budget_selection/budget_selection_screen.dart';
import '../../features/onboarding/contact_permission/contact_permission_screen.dart';
import '../../features/onboarding/contact_sync/contact_sync_screen.dart';
import '../../features/onboarding/content_prefer/content_prefer_screen.dart';
import '../../features/onboarding/verify_otp/verify_otp_cubit.dart';
import '../../features/onboarding/verify_otp/verify_otp_screen.dart';
import '../../features/onboarding/verify_phone/presentation/verify_phone_cubit.dart';
import '../../features/onboarding/verify_phone/presentation/verify_phone_screen.dart';
import '../../features/profile/user_profile/user_profile_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../shared/screens/error_404_screen.dart';
import '../../shared/screens/no_internet_screen.dart';
import '../../shared/screens/undefined_route_screen.dart';
import './app_routes.dart';

class AppRouter {
  static void setTrackRoute(String? name) {
    //Do Something
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget screen;

    final pageName = settings.name;
    setTrackRoute(pageName);

    switch (pageName) {
      case AppRoutes.noInternet:
        screen = const NoInternetScreen();
      case AppRoutes.error404:
        screen = const Error404Screen();
      case AppRoutes.splash:
        screen = const SplashScreen();
      case AppRoutes.intro:
        screen = const IntroScreen();
      case AppRoutes.auth:
        screen = const AuthScreen();

      //OnBoarding
      case AppRoutes.agreement:
        screen = const AgreementScreen();
      case AppRoutes.verifyPhone:
        screen = BlocProvider(
            create: (context) => VerifyPhoneCubit(),
            child: const VerifyPhoneScreen());
      case AppRoutes.verifyOtp:
        screen = BlocProvider(
            create: (context) => VerifyOtpCubit(),
            child: const VerifyOtpScreen());
      case AppRoutes.contactPermission:
        screen = const ContactPermissionScreen();
      case AppRoutes.contactSync:
        screen = const ContactSyncScreen();
      case AppRoutes.contentPrefer:
        screen = const ContentPreferScreen();
      case AppRoutes.budgetSelection:
        screen = const BudgetSelectionScreen();

      //Home
      case AppRoutes.home:
        screen = const HomeScreen();

      //Explore
      case AppRoutes.feedScreen:
        screen = const FeedScreen();
      case AppRoutes.circleListScreen:
        screen = const CircleListScreen();
      case AppRoutes.cityScreen:
        screen = const CityScreen();

      //Discover
      case AppRoutes.getInspiredScreen:
        screen = const GetInspiredScreen();
      case AppRoutes.previewScreen:
        screen = const PreviewScreen();

      //List
      case AppRoutes.myListsScreen:
        screen = const MyListsScreen();
      case AppRoutes.wishListScreen:
        screen = const WishListScreen();
      case AppRoutes.visitedListScreen:
        screen = const VisitedListScreen();
      case AppRoutes.addNewList:
        screen = const AddNewListScreen();

      //Profile
      case AppRoutes.profileUserScreen:
        screen = const UserProfileScreen();
      case AppRoutes.profileSettingsScreen:
        screen = const UserSettingsScreen();
      case AppRoutes.profileEditScreen:
        screen = const UserEditScreen();

      //Default
      default:
        screen = UndefinedRouteScreen(routeName: settings.name.toString());
    }

    return MaterialPageRoute(builder: (context) => screen);
  }
}
