import 'package:flutter/material.dart';
import '../widgets/wayspot_bottom_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      bottomNavigationBar: WayspotBottomBar(
        selectedIndex: 0,
        onHomeTap: () => Navigator.pushReplacementNamed(context, '/home'),
        onNotificationsTap: () =>
            Navigator.pushReplacementNamed(context, '/notifications'),
        onProfileTap: () => Navigator.pushReplacementNamed(context, '/profile'),
      ),
      floatingActionButton: const WayspotAddButton(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 88),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ExploreHeader(),
              ExploreSearchField(),
              ExploreCategorySection(),
              ExplorePopularSection(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explorar',
            style: TextStyle(
              color: Color(0xFF202522),
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Encuentra tu próximo lugar favorito',
            style: TextStyle(color: Color(0xFF707773), fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class ExploreSearchField extends StatelessWidget {
  const ExploreSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Busca lugares o ciudades',
          prefixIcon: const Icon(Icons.search, color: Color(0xFF707773)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFDDE3DF)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFDDE3DF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF1F5D50)),
          ),
        ),
      ),
    );
  }
}

class ExploreCategorySection extends StatelessWidget {
  const ExploreCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    const categories = ['Todos', 'Naturaleza', 'Cultura', 'Aventura'];
    return Padding(
      padding: const EdgeInsets.only(top: 19),
      child: SizedBox(
        height: 42,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final isSelected = index == 0;
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF1F5D50) : Colors.white,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF1F5D50)
                      : const Color(0xFFDDE3DF),
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF424844),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExplorePopularSection extends StatelessWidget {
  const ExplorePopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: Text(
            'Destinos populares',
            style: TextStyle(
              color: Color(0xFF202522),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ExplorePlaceCard(
          title: 'Cerro Monserrate',
          location: 'Bogotá, Colombia',
          category: 'Naturaleza',
          rating: '4.9',
          icon: Icons.landscape,
          backgroundColor: Color(0xFFDDEBD7),
        ),
        ExplorePlaceCard(
          title: 'Machu Picchu',
          location: 'Cusco, Perú',
          category: 'Cultura',
          rating: '5.0',
          icon: Icons.account_balance,
          backgroundColor: Color(0xFFEDE3D5),
        ),
        ExplorePlaceCard(
          title: 'Laguna de Guatavita',
          location: 'Cundinamarca, Colombia',
          category: 'Aventura',
          rating: '4.8',
          icon: Icons.water,
          backgroundColor: Color(0xFFD8E8E7),
        ),
      ],
    );
  }
}

class ExplorePlaceCard extends StatelessWidget {
  final String title;
  final String location;
  final String category;
  final String rating;
  final IconData icon;
  final Color backgroundColor;

  const ExplorePlaceCard({
    super.key,
    required this.title,
    required this.location,
    required this.category,
    required this.rating,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFDDE3DF)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 38, color: const Color(0xFF1F5D50)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0x4DBBD7B0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Color(0xFF1F5D50),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF202522),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xFF707773), fontSize: 12),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFE9B949), size: 16),
                    const SizedBox(width: 3),
                    Text(
                      rating,
                      style: const TextStyle(
                        color: Color(0xFF202522),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.bookmark_border, color: Color(0xFF707773)),
        ],
      ),
    );
  }
}
