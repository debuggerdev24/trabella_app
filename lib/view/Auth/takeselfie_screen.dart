import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/provider/camera_provider.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/profile_selfie.dart';

class Takeselfiescreen extends StatefulWidget {
  @override
  _TakeselfiescreenState createState() => _TakeselfiescreenState();
}

class _TakeselfiescreenState extends State<Takeselfiescreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CameraProvider>(context, listen: false)
        .initializeCameraController(
            previewSize: Size(0.1.sw, 0.1.sh), isFrontCamera: true);
  }

  @override
  void dispose() {
    Provider.of<CameraProvider>(context, listen: false).disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroungcolor,
        body: Consumer<CameraProvider>(builder: (conttext, provider, _) {
          return ClickingProfilePickView(profilePickerProvider: provider);
        }));
  }
}
