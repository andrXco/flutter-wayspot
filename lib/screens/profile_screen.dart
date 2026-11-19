import 'package:flutter/material.dart';
import '../widgets/wayspot_bottom_bar.dart';
import 'login_screen.dart';
import 'notifications_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      bottomNavigationBar: WayspotBottomBar(
        selectedIndex: 3,
        onNotificationsTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NotificationsScreen(),
            ),
          );
        },
      ),
      floatingActionButton: const WayspotAddButton(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileHeaderSection(),
            const SizedBox(height: 12),
            const ProfileEditButton(),
            const SizedBox(height: 4),
            const ProfileTabs(),
            const SizedBox(height: 8),
            const ProfileReviewCard(
              initials: 'V',
              authorName: 'Valentina García',
              authorUsername: '@valentina_viaja',
              placeTitle: 'Cerro Monserrate',
              placeLocation: 'Bogotá, Colombia',
              rating: 5,
              title: 'Atardecer inolvidable en la cima',
              description:
                  'Una experiencia espiritual única. La vista desde la cima al atardecer es simplemente impresionante. Subimos caminando y valió cada paso.',
              likeCount: '214',
              commentCount: '18',
              isLiked: true,
            ),
            const ProfileReviewCard(
              initials: 'V',
              authorName: 'Valentina García',
              authorUsername: '@valentina_viaja',
              placeTitle: 'Machu Picchu',
              placeLocation: 'Cusco, Perú',
              rating: 5,
              title: 'Amanecer entre las nubes',
              description:
                  'Una experiencia que te cambia la vida. Ver el amanecer sobre las ruinas con la neblina entre las montañas es algo que no olvidarás jamás.',
              likeCount: '189',
              commentCount: '14',
              isLiked: false,
            ),
            ProfileSignOutButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1F5D50),
            Color(0xFF7FA98F),
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 88,
                        height: 88,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFBBD7B0),
                          borderRadius: BorderRadius.circular(44),
                          border: Border.all(
                            color: const Color(0x73FFFFFF),
                            width: 2,
                          ),
                        ),
                        child: const Text(
                          'VG',
                          style: TextStyle(
                            color: Color(0xFF202522),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9C46A),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 14,
                          color: Color(0xFF202522),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Valentina García',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '@valentina_viaja',
                          style: TextStyle(
                            color: Color(0xC7FFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Viajera apasionada · 23 países visitados · Compartiendo el mundo un lugar a la vez',
                style: TextStyle(
                  color: Color(0xE6FFFFFF),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 16),
              const ProfileStatsCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileStatsCard extends StatelessWidget {
  const ProfileStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0x1FFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: ProfileStatItem(
              value: '1.2k',
              label: 'Seguidores',
            ),
          ),
          Container(
            width: 1,
            height: 34,
            color: const Color(0x38FFFFFF),
          ),
          const Expanded(
            child: ProfileStatItem(
              value: '184',
              label: 'Seguidos',
            ),
          ),
          Container(
            width: 1,
            height: 34,
            color: const Color(0x38FFFFFF),
          ),
          const Expanded(
            child: ProfileStatItem(
              value: '47',
              label: 'Lugares',
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileStatItem extends StatelessWidget {
  final String value;
  final String label;

  const ProfileStatItem({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xD9FFFFFF),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ProfileEditButton extends StatelessWidget {
  const ProfileEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(
              color: Color(0xFFDDE3DF),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit_outlined,
                size: 18,
                color: Color(0xFF202522),
              ),
              SizedBox(width: 8),
              Text(
                'Editar perfil',
                style: TextStyle(
                  color: Color(0xFF202522),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Mis reseñas',
                      style: TextStyle(
                        color: Color(0xFF1F5D50),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F5D50),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Guardados',
                      style: TextStyle(
                        color: Color(0xFF707773),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          color: const Color(0xFFDDE3DF),
        ),
      ],
    );
  }
}

class ProfileReviewCard extends StatelessWidget {
  final String initials;
  final String authorName;
  final String authorUsername;
  final String placeTitle;
  final String placeLocation;
  final int rating;
  final String title;
  final String description;
  final String likeCount;
  final String commentCount;
  final bool isLiked;

  const ProfileReviewCard({
    super.key,
    required this.initials,
    required this.authorName,
    required this.authorUsername,
    required this.placeTitle,
    required this.placeLocation,
    required this.rating,
    required this.title,
    required this.description,
    required this.likeCount,
    required this.commentCount,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFDDE3DF),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFBBD7B0),
                    borderRadius: BorderRadius.circular(19),
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
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authorName,
                        style: const TextStyle(
                          color: Color(0xFF202522),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        authorUsername,
                        style: const TextStyle(
                          color: Color(0xFF707773),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0x61BBD7B0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: Color(0xFF1F5D50),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    placeTitle,
                    style: const TextStyle(
                      color: Color(0xFF1F5D50),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      placeLocation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF707773),
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Icon(
                      i < rating ? Icons.star : Icons.star_border,
                      size: 18,
                      color: const Color(0xFFE07A5F),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF202522),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: const TextStyle(
                color: Color(0xFF202522),
                fontSize: 13,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ver más',
              style: TextStyle(
                color: Color(0xFF1F5D50),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: isLiked
                      ? const Color(0xFFE07A5F)
                      : const Color(0xFF707773),
                ),
                const SizedBox(width: 6),
                Text(
                  likeCount,
                  style: const TextStyle(
                    color: Color(0xFF707773),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 18),
                const Icon(
                  Icons.chat_bubble_outline,
                  size: 19,
                  color: Color(0xFF707773),
                ),
                const SizedBox(width: 6),
                Text(
                  commentCount,
                  style: const TextStyle(
                    color: Color(0xFF707773),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.share_outlined,
                  size: 20,
                  color: Color(0xFF707773),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSignOutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileSignOutButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Color(0xFFE07A5F),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                size: 18,
                color: Color(0xFFE07A5F),
              ),
              SizedBox(width: 8),
              Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: Color(0xFFE07A5F),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
