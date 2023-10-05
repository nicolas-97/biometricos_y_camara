import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class HomeViewModel extends ChangeNotifier {

  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isBiometricAvaible = false;

  bool getIsBiometricAvaible() => _isBiometricAvaible;

  // Verificar si la autenticación biométrica está disponible.
  Future<void> checkBiometricAvability() async {
    try {
      _isBiometricAvaible = await _localAuthentication.canCheckBiometrics;
      notifyListeners();
    }catch(e){
      print("Error al verificar la disponibilidad biometrica: $e");
    }
  }

  // Autenticarse utilizando la autenticación biométrica.
  Future<bool> authenticateWithBiometrics() async {
    try{
      final isBiometricAuthenticated = await _localAuthentication.authenticate(
        localizedReason: 'Autenticación biométrica requerida',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true
        )
      );

      return isBiometricAuthenticated;
    }catch(e){
      print('Error en la autenticación biométrica: $e');
      return false;
    }
  }
}
