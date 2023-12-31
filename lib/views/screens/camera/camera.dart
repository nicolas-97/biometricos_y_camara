import 'package:biometrics_camera/views/screens/camera/camera_vm.dart';
import 'package:biometrics_camera/views/screens/view_photo/view_photo_vm.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {

@override
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CameraViewModel>(context);
    final viewModelViewPhoto = Provider.of<ViewPhotoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Camara'),
      ),
      body: viewModel.getIsCameraReady()
        ? CameraPreview(viewModel.getCameraController())
        : const Center(child: CircularProgressIndicator(),),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if(viewModel.getIsCameraReady()){
              final XFile photo = await viewModel.getCameraController().takePicture();
              final String savedImagePath = await viewModel.saveImage(photo.path);
              viewModelViewPhoto.setPath(savedImagePath);
              Navigator.pushNamed(context, '/view');
            }
          },
          child: const Icon(Icons.camera),
        ),
    );
  }
}
