import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/tabs/tabs.dart';
import 'package:travel_app/view/auth/auth_complete.dart';
import 'package:travel_app/view/auth/congratulations_screen.dart';
import 'package:travel_app/view/auth/email_screen.dart';
import 'package:travel_app/view/auth/emailverified_screen.dart';
import 'package:travel_app/view/auth/idverification.dart';
import 'package:travel_app/view/auth/imageviews_screen.dart';
import 'package:travel_app/view/auth/login_screen.dart';
import 'package:travel_app/view/auth/notification_screen.dart';
import 'package:travel_app/view/auth/otp_screen.dart';
import 'package:travel_app/view/auth/referralcode_screen.dart';
import 'package:travel_app/view/auth/selfie_screen.dart';
import 'package:travel_app/view/auth/selfie_view_screen.dart';
import 'package:travel_app/view/auth/setcity/setcity_screen.dart';

import 'package:travel_app/view/auth/setpassword_screen.dart';
import 'package:travel_app/view/auth/takeselfie_screen.dart';
import 'package:travel_app/view/auth/this_or_that/cat_or_dog_screen.dart';
import 'package:travel_app/view/auth/this_or_that/this_or_that_screen.dart';
import 'package:travel_app/view/auth/take_photo_screen.dart';
import 'package:travel_app/view/chats/chat_list_screen.dart';
import 'package:travel_app/view/chats/chat_message_list.dart';
import 'package:travel_app/view/home/feedback_screen.dart';
import 'package:travel_app/view/home/feedbackverified_screen.dart';
import 'package:travel_app/view/home/home_screen.dart';
import 'package:travel_app/view/home/setting_screen.dart';
import 'package:travel_app/view/profile/myprofile_screen.dart';
import 'package:travel_app/view/profile/profile_screen.dart';
import 'package:travel_app/view/trips/trip_screen.dart.dart';
import 'package:travel_app/view/trips/trip_createscreen.dart';
import 'package:travel_app/view/wallet/wallet_screen.dart';
import 'package:travel_app/view/splash/splash_screen.dart';
import 'package:travel_app/view/waitinglist/end_of_verification.dart';
import 'package:travel_app/view/waitinglist/forty_waitinglist.dart';
import 'package:travel_app/view/welcome/intro_screen.dart';
import 'package:travel_app/view/welcome/onbording_screen.dart';

enum AppRoute {
  splashScreen,
  welcomescreen,
  onbordingscreen,
  referralcodescreen,
  emailscreen,
  otpscreen,
  verifyscreen,
  setpasswordscreen,
  notifictionscreen,
  idverificationscreen,
  takephotoscreen,
  imageviewscreen,
  selfiescren,
  takeselfiescreen,
  selfieviewscreen,
  authcompletescreen,
  congratulationscreen,
  setcityscreen,
  thisorthatscreen,
  fortywaitinglistscreen,
  endofverificationscreen,
  catordogscreen,
  loginscreen,
  ////////// BRANCH 1 //////////
  homescreen,
  myprofilescreen,
  settingscreen,
  feedbackscreen,
  feedbackverification,

  ////////// BRANCH 2 //////////
  tripsscreen,

  tripcreatedscreen,

  ////////// BRANCH 3 //////////
  walletscreen,

  ////////// BRANCH 4 //////////
  chatsscreen,
  chatmessagescreen,

  ////////// BRANCH 5 //////////
  profilescreen,
}

extension PathName on AppRoute {
  String get path =>
      switch (this) { AppRoute.homescreen => "/", _ => "/$name" };
}

class AppNavigator {
  AppNavigator._();

  static final _rootNavigator =
      GlobalKey<NavigatorState>(debugLabel: "ROOT NAVIGATOR");

  static GlobalKey<NavigatorState> get rootNavigator => _rootNavigator;

  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: "HOME NAVIGATOR");
  static final _shellNavigatorTrips =
      GlobalKey<NavigatorState>(debugLabel: "TRIPS NAVIGATOR");

  static final _shellNavigatorwallet =
      GlobalKey<NavigatorState>(debugLabel: "WALLET NAVIGATOR");

  static final _shellNavigatorchats =
      GlobalKey<NavigatorState>(debugLabel: "CHATS NAVIGATOR");

  static final _shellNavigatorprofile =
      GlobalKey<NavigatorState>(debugLabel: "PROFILE NAVIGATOR");
  static StatefulNavigationShell? indexedStackNavigationShell;

  static final router = GoRouter(
    initialLocation: AppRoute.homescreen.path,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigator,
    routes: [
      GoRoute(
        path: AppRoute.splashScreen.path,
        name: AppRoute.splashScreen.name,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoute.welcomescreen.path,
        name: AppRoute.welcomescreen.name,
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoute.onbordingscreen.path,
        name: AppRoute.onbordingscreen.name,
        builder: (context, state) => OnbordingScreen(),
      ),
      GoRoute(
        path: AppRoute.referralcodescreen.path,
        name: AppRoute.referralcodescreen.name,
        builder: (context, state) => const ReferralCodeScreern(),
      ),
      GoRoute(
        path: AppRoute.emailscreen.path,
        name: AppRoute.emailscreen.name,
        builder: (context, state) => const Emailscreen(),
      ),
      GoRoute(
        path: AppRoute.otpscreen.path,
        name: AppRoute.otpscreen.name,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: AppRoute.verifyscreen.path,
        name: AppRoute.verifyscreen.name,
        builder: (context, state) => const VerifyScreen(),
      ),
      GoRoute(
        path: AppRoute.setpasswordscreen.path,
        name: AppRoute.setpasswordscreen.name,
        builder: (context, state) => HorizontalStepper(),
      ),
      GoRoute(
        path: AppRoute.notifictionscreen.path,
        name: AppRoute.notifictionscreen.name,
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(
        path: AppRoute.idverificationscreen.path,
        name: AppRoute.idverificationscreen.name,
        builder: (context, state) => IDverificationScreen(),
      ),
      GoRoute(
        path: AppRoute.selfiescren.path,
        name: AppRoute.selfiescren.name,
        builder: (context, state) => selfieScreen(),
      ),
      GoRoute(
        path: AppRoute.takephotoscreen.path,
        name: AppRoute.takephotoscreen.name,
        builder: (context, state) {
          return TakePhotoScreen();
        },
      ),
      GoRoute(
        path: AppRoute.catordogscreen.path,
        name: AppRoute.catordogscreen.name,
        builder: (context, state) => CatOrDogScreen(),
      ),
      GoRoute(
        path: AppRoute.imageviewscreen.path,
        name: AppRoute.imageviewscreen.name,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final imagePath = extra?['imagePath'] ?? "";

          return ImageviewsScreen(imagePath: imagePath);
        },
      ),
      GoRoute(
        path: AppRoute.selfieviewscreen.path,
        name: AppRoute.selfieviewscreen.name,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final imagePath = extra?['imagePath'] ?? "";

          return SelfieviewScreen(imagePath: imagePath);
        },
      ),
      GoRoute(
        path: AppRoute.takeselfiescreen.path,
        name: AppRoute.takeselfiescreen.name,
        builder: (context, state) {
          return Takeselfiescreen();
        },
      ),
      GoRoute(
        path: AppRoute.authcompletescreen.path,
        name: AppRoute.authcompletescreen.name,
        builder: (context, state) {
          return const AuthCompletedScreen();
        },
      ),
      GoRoute(
        path: AppRoute.congratulationscreen.path,
        name: AppRoute.congratulationscreen.name,
        builder: (context, state) {
          return CongratulationsScreen();
        },
      ),
      GoRoute(
        path: AppRoute.setcityscreen.path,
        name: AppRoute.setcityscreen.name,
        builder: (context, state) {
          return SetcityScreen();
        },
      ),
      GoRoute(
        path: AppRoute.thisorthatscreen.path,
        name: AppRoute.thisorthatscreen.name,
        builder: (context, state) {
          return const ThisOrThatScreen();
        },
      ),
      GoRoute(
        path: AppRoute.fortywaitinglistscreen.path,
        name: AppRoute.fortywaitinglistscreen.name,
        builder: (context, state) {
          return const FortyWaitinglistSCreen();
        },
      ),
      GoRoute(
        path: AppRoute.endofverificationscreen.path,
        name: AppRoute.endofverificationscreen.name,
        builder: (context, state) {
          return const EndofverificationScreen();
        },
      ),
      GoRoute(
          path: AppRoute.myprofilescreen.path,
          name: AppRoute.myprofilescreen.name,
          builder: (BuildContext context, GoRouterState state) =>
              const MyprofileScreen()),
      GoRoute(
          path: AppRoute.settingscreen.path,
          name: AppRoute.settingscreen.name,
          builder: (BuildContext context, GoRouterState state) =>
              const SettingScreen()),
      GoRoute(
        path: AppRoute.feedbackscreen.path,
        name: AppRoute.feedbackscreen.name,
        builder: (context, state) {
          return FeedbackScreen();
        },
      ),
      GoRoute(
        path: AppRoute.feedbackverification.path,
        name: AppRoute.feedbackverification.name,
        builder: (context, state) {
          return FeedbackverifiedScreen();
        },
      ),
      GoRoute(
        path: AppRoute.loginscreen.path,
        name: AppRoute.loginscreen.name,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          indexedStackNavigationShell = navigationShell;
          return TabScreen(
            key: state.pageKey,
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.homescreen.path,
                name: AppRoute.homescreen.name,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeScreen(),
                routes: <RouteBase>[

                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorTrips,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.tripsscreen.path,
                name: AppRoute.tripsscreen.name,
                builder: (BuildContext context, GoRouterState state) =>
                    const TripsScreen(),
                routes: <RouteBase>[
                  // GoRoute(
                  //   path: AppRoute.tripcreatedscreen.name,
                  //   name: AppRoute.tripcreatedscreen.name,
                  //   builder: (BuildContext context, GoRouterState state) =>
                  //       const TripcreatedScreen(),
                  // )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorwallet,
            routes: <RouteBase>[
              GoRoute(
                  path: AppRoute.walletscreen.path,
                  name: AppRoute.walletscreen.name,
                  builder: (BuildContext context, GoRouterState state) =>
                      const WalletScreen())
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorchats,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.chatsscreen.path,
                name: AppRoute.chatsscreen.name,
                builder: (BuildContext context, GoRouterState state) =>
                    const ChatScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: AppRoute.chatmessagescreen.name,
                    name: AppRoute.chatmessagescreen.name,
                    builder: (BuildContext context, GoRouterState state) =>
                        ChatmessageScreen(),
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorprofile,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.profilescreen.path,
                name: AppRoute.profilescreen.name,
                builder: (BuildContext context, GoRouterState state) =>
                    ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
