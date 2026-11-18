
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            const Text(
              'Wayspot',
              style: TextStyle(
                color: Color(0xFF202522),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Tu próximo destino te espera',
              style: TextStyle(
                color: Color(0xFF707773),
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 40),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                hintText: 'tu@correo.com',
              ),
            ),

            const SizedBox(height: 14),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingresa tu contraseña',
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xFF1F5D50),
                  ),
                ),
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Color(0xFF1F5D50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
