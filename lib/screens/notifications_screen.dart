import 'package:flutter/material.dart';
import '../widgets/wayspot_bottom_bar.dart';
import 'profile_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      bottomNavigationBar: WayspotBottomBar(
        selectedIndex: 1,
        onProfileTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        },
      ),
      floatingActionButton: const WayspotAddButton(),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const NotificationsHeader(),
            Container(
              height: 1,
              color: const Color(0xFFDDE3DF),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NotificationSectionTitle(title: 'HOY'),
                    NotificationItem(
                      initials: 'CM',
                      username: 'Carlos Medina',
                      actionText: 'comenzó a seguirte.',
                      timeText: 'Hace 5 min',
                    ),
                    NotificationItem(
                      initials: 'LS',
                      username: 'Laura Sánchez',
                      actionText: 'le gustó tu reseña.',
                      detail: 'Una experiencia increíble',
                      timeText: 'Hace 23 min',
                    ),
                    NotificationItem(
                      initials: 'MT',
                      username: 'Miguel Torres',
                      actionText: 'le gustó tu reseña.',
                      detail: 'Atardecer inolvidable en la cima',
                      timeText: 'Hace 2 h',
                    ),
                    NotificationSectionTitle(title: 'ANTERIORES'),
                    NotificationItem(
                      initials: 'AC',
                      username: 'Andrés Cano',
                      actionText: 'comenzó a seguirte.',
                      timeText: 'Ayer',
                    ),
                    NotificationItem(
                      initials: 'CT',
                      username: 'Camila Torres',
                      actionText: 'le gustó tu reseña.',
                      detail: 'Amanecer entre las nubes',
                      timeText: 'Hace 3 días',
                    ),
                    NotificationItem(
                      initials: 'MP',
                      username: 'María Polo',
                      actionText: 'comenzó a seguirte.',
                      timeText: 'Hace 5 días',
                    ),
                    SizedBox(height: 88),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Text(
        'Notificaciones',
        style: TextStyle(
          color: Color(0xFF202522),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotificationSectionTitle extends StatelessWidget {
  final String title;

  const NotificationSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF707773),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String initials;
  final String username;
  final String actionText;
  final String detail;
  final String timeText;

  const NotificationItem({
    super.key,
    required this.initials,
    required this.username,
    required this.actionText,
    this.detail = '',
    required this.timeText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFBBD7B0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  initials,
                  style: const TextStyle(
                    color: Color(0xFF202522),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          color: Color(0xFF202522),
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: '$username ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(text: actionText),
                        ],
                      ),
                    ),
                    if (detail.isNotEmpty) ...[
                      const SizedBox(height: 3),
                      Text(
                        detail,
                        style: const TextStyle(
                          color: Color(0xFF707773),
                          fontSize: 12,
                        ),
                      ),
                    ],
                    const SizedBox(height: 3),
                    Text(
                      timeText,
                      style: const TextStyle(
                        color: Color(0xFF1F5D50),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 72),
          child: Container(
            height: 1,
            color: const Color(0xFFDDE3DF),
          ),
        ),
      ],
    );
  }
}
