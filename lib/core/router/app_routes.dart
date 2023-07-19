class AppRoutes {
  AppRoutes._();

  static const String noInternet = '/noInternet';
  static const String error404 = '/error/404';

  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String home = '/home';

  static const String auth = '/auth';

  //OnBoarding
  static const String agreement = '/onboarding/agreement';
  static const String verifyPhone = '/onboarding/verify/phone';
  static const String verifyOtp = '/onboarding/verify/otp';
  static const String contactPermission = '/onboarding/contact/permission';
  static const String contactSync = '/onboarding/contact/sync';
  static const String contentPrefer = '/onboarding/content/prefer';
  static const String budgetSelection = '/onboarding/budget-selection';

  //Explore
  static const String feedScreen = "/explore/feed";
  static const String circleListScreen = "/explore/circlelist";
  static const String cityScreen = "/explore/city";

  //Discover
  static const String getInspiredScreen = "/discover/getinspired";
  static const String previewScreen = "/discover/preview";

  //Lists
  static const String myListsScreen = "/lists/myList";
  static const String wishListScreen = "/lists/wishlist";
  static const String visitedListScreen = "/lists/visitedlist";
  static const String addNewList = '/lists/add-new-list';

  //Profile
  static const String profileUserScreen = "/profile/user";
  static const String profileSettingsScreen = "/profile/settings";
  static const String profileEditScreen = "/profile/edit";
}
