
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),

            Image.asset(
              'assets/images/branding_icono_claro_wayspot.png',
              height: 68,
              width: 68,
            ),

            const SizedBox(height: 8),

            const Text(
              'Wayspot',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF202522),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              'Tu próximo destino te espera',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF707773),
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 39),

            const LoginField(
              label: 'Correo Electrónico',
              hint: 'tu@correo.com',
              iconPath: 'assets/images/mail.png',
            ),

            const SizedBox(height: 14),

            const LoginField(
              label: 'Contraseña',
              hint: 'Ingresa tu contraseña',
              iconPath: 'assets/images/lock.png',
              isPassword: true,
            ),

            const SizedBox(height: 15),

            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Color(0xFF1F5D50),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            SizedBox(
              height: 54,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F5D50),
                  side: const BorderSide(
                    color: Color(0xFF1F5D50),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 51),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xFFD2CFD8),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'o continúa con',
                    style: TextStyle(
                      color: Color(0xFF707773),
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xFFD2CFD8),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            SizedBox(
              height: 54,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xFFD2CFD8),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon_google.png',
                      width: 22,
                      height: 22,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Continuar con Google',
                      style: TextStyle(
                        color: Color(0xFF202522),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 42),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿No tienes cuenta? ',
                  style: TextStyle(
                    color: Color(0xFF707773),
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Regístrate',
                  style: TextStyle(
                    color: Color(0xFF1F5D50),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginField extends StatelessWidget {
  final String label;
  final String hint;
  final String iconPath;
  final bool isPassword;

  const LoginField({
    super.key,
    required this.label,
    required this.hint,
    required this.iconPath,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF202522),
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 7),

        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F3F1),
            border: Border.all(
              color: const Color(0xFFD2CFD8),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(
                iconPath,
                height: 21,
                width: 21,
              ),

              const SizedBox(width: 14),

              Expanded(
                child: TextField(
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: const TextStyle(
                      color: Color(0xFF808984),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              if (isPassword)
                Image.asset(
                  'assets/images/view.png',
                  width: 21,
                  height: 21,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
