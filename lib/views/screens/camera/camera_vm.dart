import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraViewModel extends ChangeNotifier{

  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraReady = false;

  CameraViewModel(){
    initializeCamera(); 
  }

  CameraController getCameraController() => _cameraController;
  bool getIsCameraReady() => _isCameraReady;

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[2], ResolutionPreset.max);
    await _cameraController.initialize();
    _isCameraReady = true;
    notifyListeners();
  }

  Future<String> saveImage(String path) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    //final String savePath = "${appDocDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";
    final String savePath = '/storage/emulated/0/DCIM/Camera/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final File newImage = await File(path).copy(savePath);
    return newImage.path;
  }
}