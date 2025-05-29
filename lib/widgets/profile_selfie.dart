import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/provider/camera_provider.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';

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
                    child: RotatedBox(
                      quarterTurns: 4,
                      child: CameraPreview(
                          widget.profilePickerProvider.controller!),
                    ),
                  ),
                ),

                // Blurred background with oval cutout
                ClipPath(
                  clipper: OvalClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),

                // Oval with dotted border
                Center(
                  child: DottedBorder(
                    borderType: BorderType.Oval,
                    color: Colors.white,
                    strokeWidth: 2,
                    dashPattern: [8, 4],
                    child: SizedBox(
                      width: 0.75.sw,
                      height: 0.45.sh,
                    ),
                  ),
                ),

        
                Positioned.fill(
                  child: Center(
                      child: GlobalText(
                    'MOVE YOUR FACE\nINSIDE THE OVAL',
                    textStyle: textStyle18SemiBold.copyWith(
                      fontSize: 20.sp,
                      color: AppColors.backgroungcolor,
                    ),
                  )),
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
            ),
    );
  }
}

class OvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    path.addOval(Rect.fromCenter(
      center: Offset(size.width / 2, size.height * 0.5),
      width: size.width * 0.75,
      height: size.height * 0.45,
    ));

    return path..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
