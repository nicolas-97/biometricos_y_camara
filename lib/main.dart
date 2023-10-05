import 'package:biometrics_camera/views/screens/camera/camera.dart';
import 'package:biometrics_camera/views/screens/camera/camera_vm.dart';
import 'package:biometrics_camera/views/screens/home/home.dart';
import 'package:biometrics_camera/views/screens/home/home_vm_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => CameraViewModel())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/camera' : (context) => const Camera() 
      },
    );
  }
}