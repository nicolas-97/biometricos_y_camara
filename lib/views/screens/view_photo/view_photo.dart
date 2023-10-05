import 'dart:io';
import 'package:biometrics_camera/views/screens/view_photo/view_photo_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewPhoto extends StatefulWidget {
  const ViewPhoto({super.key});

  @override
  State<ViewPhoto> createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ViewPhotoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Foto Capturada'),
      ),
      body: Center(
        child: Image.file(File(viewModel.getPath())),
      ),
    );
  }
}