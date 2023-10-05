import 'package:biometrics_camera/views/screens/home/home_vm_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).checkBiometricAvability();
  }
  
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Autenticarse con biometricos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (viewModel.getIsBiometricAvaible())
              ElevatedButton(
                onPressed: () async {
                  final isAuthenticated = await viewModel.authenticateWithBiometrics();
                  if (isAuthenticated) {
                    print("Se ha podido autenticar");
                  }
                },
                child: Text('Autenticarse con Biométricos'),
              )
            else
              Text('La autenticación biométrica no está disponible en este dispositivo.'),
          ],
        ),
      ),
    );
  }
}