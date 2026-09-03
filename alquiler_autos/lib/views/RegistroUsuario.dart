import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registrousuario extends StatefulWidget {
  const Registrousuario({super.key});

  @override
  State<Registrousuario> createState() => _RegistrousuarioState();
}

class _RegistrousuarioState extends State<Registrousuario> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _licenseController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final Color _background = const Color(0xFFAFDDFF);
  final Color _header = const Color(0xFF60B5FF);
  final Color _field = const Color(0xFFFFECDB);
  final Color _button = const Color(0xFFFF9149);
  final Color _text = const Color(0xFF222222);

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('userName', _nameController.text.trim());
    await preferences.setString('userEmail', _emailController.text.trim());
    await preferences.setString('license', _licenseController.text.trim());
    await preferences.setString('userPassword', _passwordController.text);

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }

  String? _required(String? value, String message) {
    return value == null || value.trim().isEmpty ? message : null;
  }

  InputDecoration _decoration(String label, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: _field,
      labelText: label,
      labelStyle: TextStyle(color: _text),
      prefixIcon: Icon(icon, color: _header),
      contentPadding: const EdgeInsets.symmetric(vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _licenseController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
            child: Column(
              children: [
                Icon(Icons.person_add_alt_1, size: 72, color: _header),
                const SizedBox(height: 8),
                Text(
                  'Empecemos',
                  style: TextStyle(
                    color: _header,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Crear una nueva cuenta',
                  style: TextStyle(color: _text.withOpacity(0.75)),
                ),
                const SizedBox(height: 28),
                TextFormField(
                  controller: _nameController,
                  decoration: _decoration('Nombre completo', Icons.person),
                  validator: (value) =>
                      _required(value, 'Digite su nombre completo'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _decoration('Correo electrónico', Icons.email),
                  validator: (value) => _required(value, 'Digite su correo'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _licenseController,
                  decoration: _decoration('Número de licencia', Icons.badge),
                  validator: (value) =>
                      _required(value, 'Digite su número de licencia'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: _decoration('Contraseña', Icons.lock),
                  validator: (value) =>
                      _required(value, 'Digite su contraseña'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: _decoration(
                    'Confirmar contraseña',
                    Icons.lock_outline,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirme su contraseña';
                    }
                    if (value != _passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _button,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Registrarme'),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                  child: Text(
                    '¿Ya tienes una cuenta?  Iniciar sesión',
                    style: TextStyle(color: _header),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
