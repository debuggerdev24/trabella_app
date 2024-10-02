import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

   @override
    void dispose() {
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Column(
        children: <Widget>[
          20.w.horizontalSpace,
          Transform.translate(
              offset: const Offset(70, 0),
              child: Image.asset(AppAssets.slpashgif)),
          const Spacer(),
          const Divider(
            color: Colors.black,
            thickness: 1,
            indent: 60,
            endIndent: 60,
          ),
          20.h.verticalSpace,
          Image.asset(AppAssets.appname),
          60.h.verticalSpace,
        ],
      ),
    );
  }

  startTimer() {
    var duration = const Duration(milliseconds: 2000);
    return Future.delayed(
      duration,
      () {
        context.goNamed(AppRoute.welcomescreen.name);
      },
    );
  }
}
