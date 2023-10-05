import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraViewModel extends ChangeNotifier{

  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraReady = false;

  CameraViewModel(){
    initializeCamera(); 
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[1], ResolutionPreset.high);
    await _cameraController.initialize();
    _isCameraReady = true;
    notifyListeners();
  }

  CameraController getCameraController() => _cameraController;
  bool getIsCameraReady() => _isCameraReady;

  
}