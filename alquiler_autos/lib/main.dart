import 'package:alquiler_autos/views/RegistroUsuario.dart';
import 'package:alquiler_autos/views/menuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:alquiler_autos/views/loginScreen.dart';

void main() {
  runApp(const AlquilerAutos());
}

class AlquilerAutos extends StatelessWidget {
  const AlquilerAutos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Registrousuario(),
      routes: {
        '/registroUsuarios': (context) => const Registrousuario(),
        '/login': (context) => const LoginScreen(),
        '/menu': (context) => MenuPrincipal(autos: autos),
      },
    );
  }
}
