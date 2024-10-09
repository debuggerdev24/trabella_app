import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CameraProvider with ChangeNotifier {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;
  XFile? _tempFile;

  CameraController? get controller => _controller;
  bool get isCameraInitialized => _isCameraInitialized;
  XFile? get imageFile => _tempFile;

  Future<void> initializeCameraController({
    Size? previewSize,
    required bool isFrontCamera,
  }) async {
    try {
      final List<CameraDescription> cameras = await availableCameras();
      final CameraDescription? selectedCamera = cameras.firstWhere(
        (camera) =>
            camera.lensDirection ==
            (isFrontCamera
                ? CameraLensDirection.front
                : CameraLensDirection.back),
      );

      if (selectedCamera == null) return;
      _controller = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _controller!.initialize();
      _isCameraInitialized = true;
      _controller!.value =
          _controller!.value.copyWith(previewSize: previewSize);
 
      notifyListeners();
    } catch (e) {
      log("$e", name: "ERROR");
    }
  }

  Future<void> takePhoto() async {
    setTempFile(await _controller!.takePicture(), true);
  }

  void setTempFile(XFile? value, bool isCamera) {
    if (value != null) {
      _tempFile = value;
      notifyListeners();
    }
  }

  void disposeCamera() {
    _controller?.dispose();
  }
}
