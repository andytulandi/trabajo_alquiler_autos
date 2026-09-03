import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final Color background = const Color(0xFFAFDDFF);
  final Color header = const Color(0xFF60B5FF);
  final Color field = const Color(0xFFFFECDB);
  final Color button = const Color(0xFFFF9149);

  Future<void> _login() async {
    final preferences = await SharedPreferences.getInstance();
    final savedEmail = preferences.getString('userEmail');
    final savedPassword = preferences.getString('userPassword');

    if (!mounted) return;
    if (_emailController.text.trim() == savedEmail &&
        _passwordController.text == savedPassword) {
      Navigator.pushReplacementNamed(context, '/menu');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correo o contrasena incorrectos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Icon(Icons.person_pin, size: 80, color: header),
            const SizedBox(height: 16),
            Text(
              'Bienvenido',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: header,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Inicia sesion para continuar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 90),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: field,
                labelText: 'Correo electronico',
                prefixIcon: Icon(Icons.email, color: header),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: field,
                labelText: 'Contrasena',
                prefixIcon: Icon(Icons.password, color: header),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: button,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Iniciar sesion'),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/registroUsuarios'),
              child: Text(
                'No tengo cuenta: Registrarme',
                style: TextStyle(color: header),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
