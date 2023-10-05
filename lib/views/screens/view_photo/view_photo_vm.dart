import 'package:flutter/material.dart';

class ViewPhotoViewModel extends ChangeNotifier {
  late String _path;

  setPath(String $path) {
    _path = $path;
    notifyListeners();
  }

  String getPath() => _path;
}