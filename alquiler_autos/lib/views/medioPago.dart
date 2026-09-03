import 'package:flutter/material.dart';

class MedioPagoScreen extends StatelessWidget {
  const MedioPagoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medio de pago')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Selecciona un medio de pago',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Medio de pago',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Tarjeta', child: Text('Tarjeta')),
                DropdownMenuItem(value: 'Efectivo', child: Text('Efectivo')),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Solicitud registrada.')),
                );
              },
              child: const Text('Confirmar alquiler'),
            ),
          ],
        ),
      ),
    );
  }
}
