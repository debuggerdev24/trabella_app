import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/provider/camera_provider.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/view/Auth/selfie_screen.dart';

class ClickingProfilePickView extends StatefulWidget {
  const ClickingProfilePickView(
      {super.key, required this.profilePickerProvider});
  final CameraProvider profilePickerProvider;

  @override
  State<ClickingProfilePickView> createState() =>
      _ClickingProfilePickViewState();
}

class _ClickingProfilePickViewState extends State<ClickingProfilePickView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.profilePickerProvider.controller != null &&
                widget.profilePickerProvider.controller!.value.isInitialized
            ? Stack(
                children: [
                  AspectRatio(
                      aspectRatio: 1.sw / 1.sh,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(3.14159),
                        child: CameraPreview(
                            widget.profilePickerProvider.controller!),
                      )),
                  ClipPath(
                    clipper: CircleClipper(),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          await widget.profilePickerProvider.takePhoto();
                          context.pushNamed(
                            AppRoute.selfieviewscreen.name,
                            extra: {
                              'imagePath':
                                  widget.profilePickerProvider.imageFile!.path,
                            },
                          );
                        },
                        child: Container(
                          height: 80.w,
                          width: 80.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.8),
                            border: Border.all(
                              color: Colors.white,
                              width: 5.w,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: AppColors.redcolor,
                            size: 40.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, 0.82.sw / 2 + 235.h),
        radius: 0.82.sw / 2));
    return path..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
