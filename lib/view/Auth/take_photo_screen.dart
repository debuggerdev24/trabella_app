import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/camera_provider.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';

class TakePhotoScreen extends StatefulWidget {
  @override
  _TakePhotoScreenState createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CameraProvider>(context, listen: false)
        .initializeCameraController(
            previewSize: Size(0.8.sw, 250.h), isFrontCamera: false);
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
      body: SafeArea(
        child: Consumer<CameraProvider>(
          builder: (context, cameraProvider, child) {
            if (cameraProvider.isCameraInitialized) {
              return SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(8),
                          dashPattern: [6, 3],
                          color: AppColors.greycolor,
                          strokeWidth: 3,
                          child: AspectRatio(
                            aspectRatio:
                                cameraProvider.controller!.value.aspectRatio,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: CameraPreview(cameraProvider.controller!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: cameraProvider.imageFile == null
                          ? GlobalText(
                              'MOVE YOUR ID INSIDE THE BORDER',
                              textStyle: textStyle18SemiBold.copyWith(
                                color: AppColors.backgroungcolor,
                              ),
                            )
                          : Container(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () async {
                          await cameraProvider.takePhoto();

                          context.pushNamed(
                            AppRoute.imageviewscreen.name,
                            extra: {
                              'imagePath': cameraProvider.imageFile!.path,
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SvgPicture.asset(AppAssets.takephoto),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget cameraWidget(CameraProvider provider) {
    final size = Size(0.8.sw, 300.h);
    var scale = provider.controller!.value.aspectRatio / size.aspectRatio;
    if (provider.controller!.value.aspectRatio < size.aspectRatio) {
      scale = 1 / scale;
    }

    return Transform.scale(
      scale: scale,
      child: Center(
        child: AspectRatio(
          aspectRatio: provider.controller!.value.aspectRatio,
          child: CameraPreview(provider.controller!),
        ),
      ),
    );
  }
}
