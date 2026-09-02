import 'package:alquiler_autos/views/menuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:alquiler_autos/views/loginScreen.dart';
void main(List<String> args) {
  runApp(const alquiler_autos());
}

class alquiler_autos extends StatefulWidget {
  const alquiler_autos({super.key});

  @override
  State<alquiler_autos createState() => _alquiler_autosState

}
class _alquiler_autosState extends State<alquiler_autos> {
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPrincipal(),
      routes: {
        '/menuprincipal':(context) => MenuPrincipal(),
      },
    );
  }

}
