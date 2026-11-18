
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),

            Image.asset(
              'assets/images/branding_icono_claro_wayspot.png',
              height: 68,
              width: 68,
            ),

            const SizedBox(height: 8),

            const Text(
              'Crear Cuenta',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF202522),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              'Comienza tu próxima aventura de viaje',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF707773),
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 22),

            const LoginField(
              label: 'Nombre Completo',
              hint: 'Valentina Cruz',
              iconPath: 'assets/images/person.png',
            ),

            const SizedBox(height: 9),

            const LoginField(
              label: 'Nombre de usuario',
              hint: '@tu_usuario',
              iconPath: 'assets/images/person.png',
            ),

            const SizedBox(height: 9),

            const LoginField(
              label: 'Correo Electrónico',
              hint: 'tu@correo.com',
              iconPath: 'assets/images/mail.png',
            ),

            const SizedBox(height: 9),

            const LoginField(
              label: 'Contraseña',
              hint: 'Mínimo 8 caracteres',
              iconPath: 'assets/images/lock.png',
              isPassword: true,
            ),

            const SizedBox(height: 9),

            const LoginField(
              label: 'Confirmar contraseña',
              hint: 'Repite tu contraseña',
              iconPath: 'assets/images/shield.png',
              isPassword: true,
            ),

            const SizedBox(height: 12),

            const Row(
              children: [
                Expanded(
                  child: StrengthBar(),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: StrengthBar(),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: StrengthBar(),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: StrengthBar(),
                ),
              ],
            ),

            const SizedBox(height: 7),

            const Text(
              'Seguridad: Sin evaluar',
              style: TextStyle(
                color: Color(0xFF808984),
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                Container(
                  width: 19,
                  height: 19,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF808984),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Acepto los ',
                            style: TextStyle(
                              color: Color(0xFF808984),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Términos de servicio',
                            style: TextStyle(
                              color: Color(0xFF1F5D50),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            ' y la',
                            style: TextStyle(
                              color: Color(0xFF808984),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Política de privacidad',
                        style: TextStyle(
                          color: Color(0xFF1F5D50),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFFDDE3DF),
                  side: const BorderSide(
                    color: Color(0xFFDDE3DF),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Crear cuenta',
                  style: TextStyle(
                    color: Color(0xFFAFB9B5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Ya tienes cuenta? ',
                  style: TextStyle(
                    color: Color(0xFF707773),
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Inicia sesión',
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

class StrengthBar extends StatelessWidget {
  const StrengthBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: const Color(0xFFD2CFD8),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
