import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/view/Auth/auth_complete.dart';
import 'package:travel_app/view/Auth/email_screen.dart';
import 'package:travel_app/view/Auth/emailverified_screen.dart';
import 'package:travel_app/view/Auth/idverification.dart';
import 'package:travel_app/view/Auth/imageviews_screen.dart';
import 'package:travel_app/view/Auth/notification_screen.dart';
import 'package:travel_app/view/Auth/otp_screen.dart';
import 'package:travel_app/view/Auth/referralcode_screen.dart';
import 'package:travel_app/view/Auth/selfie_screen.dart';
import 'package:travel_app/view/Auth/selfie_view.dart';
import 'package:travel_app/view/Auth/setpassword_screen.dart';
import 'package:travel_app/view/Auth/takeselfie_screen.dart';
import 'package:travel_app/view/Auth/verifiaction_screen.dart';
import 'package:travel_app/view/splash/splash_screen.dart';
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
  ////////// BRANCH 1 //////////

  ////////// BRANCH 2 //////////

  ////////// BRANCH 3 //////////

  ////////// BRANCH 4 //////////
}

extension PathName on AppRoute {
  String get path =>
      switch (this) { AppRoute.splashScreen => "/", _ => "/$name" };
}

class AppNavigator {
  AppNavigator._();

  static final _rootNavigator =
      GlobalKey<NavigatorState>(debugLabel: "ROOT NAVIGATOR");

  static GlobalKey<NavigatorState> get rootNavigator => _rootNavigator;

  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: "INVENTORY NAVIGATOR");
  static final _shellNavigatorChecklist =
      GlobalKey<NavigatorState>(debugLabel: "CHECKLIST NAVIGATOR");

  static final _shellNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: "PROFILE NAVIGATOR");

  static final _shellNavigatorNotification =
      GlobalKey<NavigatorState>(debugLabel: "NOTIFICATION NAVIGATOR");
  static StatefulNavigationShell? indexedStackNavigationShell;

  static final router = GoRouter(
    initialLocation: AppRoute.splashScreen.path,
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
        name: AppRoute.authcompletescreen.name,
        builder: (context, state) {
          return const AuthCompletedScreen();
        },
      ),
    ],
  );
}
