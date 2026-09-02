import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color fondo = Color(0xFFAFDDFF);
  final Color encabezado = Color(0xFF60B5FF);
  final Color campos = Color(0xFFFFECDB);
  final Color boton = Color(0xFFFF9149);
  final Color texto = Color(0xFF222222);
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: fondo,
    body: Padding(
      padding : const EdgeInsets.all(20.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Icon(Icons.person_pin,
          size: 80,
          color: encabezado,
          ),//icono de usuario
          SizedBox(height: 16),
          Text("Bienvenido",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: encabezado,
          ),
          ),//texto de bienvenida
          SizedBox(height: 8),
          Text("Inicia sesión para continuar",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: texto.withOpacity(0.7),
          ),
          ),//texto de instrucción
          SizedBox(height: 90),
          TextField(
            style: TextStyle(color: texto),
            decoration: InputDecoration(
              filled:true,
              fillColor: campos,
              labelText: "Correo electrónico",
              labelStyle: TextStyle(color: texto),
              prefixIcon: Icon(Icons.email, color: encabezado),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )// input decoration
            ),// text field decoration
          ),//campo de correo electrónico
          SizedBox(height: 16),
          TextField(
            obscureText:true,
            style: TextStyle(color: texto),
            decoration: InputDecoration(
              filled:true,
              fillColor: campos,
              labelText: "Contraseña",
              labelStyle: TextStyle(color: texto),
              prefixIcon: Icon(Icons.password, color: encabezado),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )// input decoration
          ), //text field decoration
          ),//campo de contraseña
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPrincipal()
                ),//materialpage route
              );
            },//button on pressed
            style: ElevatedButton.styleFrom(
              backgroundColor: boton,
              minimumSize: Size(double.infinity,48),
            ),//button style
            child: Text("Iniciar sesión",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              )
            )//button
          ),//Elevatedbutton
          SizedBox(height: 30),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              Text("¿olvidaste tu contraseña?",
                style: TextStyle(color: texto),
                ),//text
              TextButton(
                onPressed:(){},
                child: Text("Recuperar",
                  style: TextStyle(
                    color: encabezado,
                    fontWeight: FontWeight.bold,
                  ),//textstyle
                ),// texto
              ),//textbutton
              SizedBox(width: 12),
            ],
          ),// Row
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              Text("¿No tienes cuenta?",
                style: TextStyle(color: texto),
                ),//text
              TextButton(
                onPressed:(){},
                child: Text("Registrate",
                  style: TextStyle(
                    color: encabezado,
                    fontWeight: FontWeight.bold,
                  ),//textstyle
                ),// texto
              ),//textbutton
              SizedBox(width: 12),
            ],
          ),// Row
               
        ],// children
      ),
  )
  );
}