import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/provider/camera_provider.dart';
import 'package:travel_app/provider/home_provider.dart';
import 'package:travel_app/provider/trips_provider.dart';
import 'package:travel_app/utils/routes/route.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Authprovider>(create: (_) => Authprovider()),
        ChangeNotifierProvider<CameraProvider>(create: (_) => CameraProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<TripProvider>(create: (_) => TripProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return buildMyapp(context);
  }

  Widget buildMyapp(BuildContext context) => ScreenUtilInit(
      designSize: const Size(430, 932),
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'TRABELLA APP',
          routerConfig: AppNavigator.router,
          debugShowCheckedModeBanner: false,
        );
      });
}
