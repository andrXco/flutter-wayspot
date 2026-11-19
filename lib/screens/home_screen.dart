import 'package:flutter/material.dart';

import '../widgets/wayspot_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      floatingActionButton: const WayspotAddButton(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 88),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HomeHeader(),
              const HomeCategoryChips(),
              const HomeFeaturedCarousel(),
              const HomeSectionTitle(
                title: 'Reseñas recientes',
                subtitle: 'Experiencias compartidas por la comunidad',
              ),
              const HomeReviewCard(
                initials: 'CM',
                authorName: 'Carlos Medina',
                authorUsername: '@carlos.explora',
                placeTitle: 'Cerro Monserrate',
                placeLocation: 'Bogotá, Colombia',
                rating: 5,
                title: 'Atardecer inolvidable en la cima',
                description: 'La vista desde la cima al atardecer es impresionante. Subimos caminando y cada paso valió la pena.',
                likeCount: '214',
                commentCount: '18',
              ),
              const HomeReviewCard(
                initials: 'LS',
                authorName: 'Laura Sánchez',
                authorUsername: '@laura.viajera',
                placeTitle: 'Machu Picchu',
                placeLocation: 'Cusco, Perú',
                rating: 5,
                title: 'Amanecer entre las nubes',
                description: 'Ver el amanecer sobre las ruinas con la neblina entre las montañas es una experiencia que no se olvida.',
                likeCount: '189',
                commentCount: '14',
              ),
              const HomeReviewCard(
                initials: 'MT',
                authorName: 'Miguel Torres',
                authorUsername: '@miguel.rutas',
                placeTitle: 'Laguna de Guatavita',
                placeLocation: 'Cundinamarca, Colombia',
                rating: 4,
                title: 'Naturaleza a pocas horas de Bogotá',
                description: 'Un recorrido tranquilo, rodeado de naturaleza y con una historia fascinante. Lleva ropa abrigada.',
                likeCount: '96',
                commentCount: '8',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 14, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeSearchBar(),
          SizedBox(height: 14),
          Text(
            'Tu próximo plan',
            style: TextStyle(
              color: Color(0xFF202522),
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Encuentra un lugar para salir de la rutina',
            style: TextStyle(color: Color(0xFF707773), fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: 'Busca un lugar o ciudad...',
        hintStyle: const TextStyle(color: Color(0xFF858C88), fontSize: 14),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF707773)),
        filled: true,
        fillColor: const Color(0xFFF7F8F5),
        contentPadding: const EdgeInsets.symmetric(vertical: 13),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: Color(0xFF98BBA4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: Color(0xFF1F5D50), width: 1.5),
        ),
      ),
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }
}

class HomeCategoryChips extends StatelessWidget {
  const HomeCategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
        children: const [
          _HomeCategoryChip(
            title: 'Naturaleza',
            icon: Icons.eco,
            isSelected: true,
          ),
          SizedBox(width: 8),
          _HomeCategoryChip(title: 'Gastronomía', icon: Icons.restaurant),
          SizedBox(width: 8),
          _HomeCategoryChip(title: 'Escapadas', icon: Icons.luggage),
          SizedBox(width: 8),
          _HomeCategoryChip(title: 'Cultura', icon: Icons.account_balance),
        ],
      ),
    );
  }
}

class _HomeCategoryChip extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;

  const _HomeCategoryChip({
    required this.title,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isSelected ? Colors.white : const Color(0xFF707773);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1F5D50) : const Color(0xFFE0E5E2),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: foregroundColor),
          const SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeFeaturedCarousel extends StatefulWidget {
  const HomeFeaturedCarousel({super.key});

  @override
  State<HomeFeaturedCarousel> createState() => _HomeFeaturedCarouselState();
}

class _HomeFeaturedCarouselState extends State<HomeFeaturedCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _currentPage = 0;

  static const List<_FeaturedPlace> _places = [
    _FeaturedPlace(
      title: 'Machu Picchu',
      location: 'Cusco, Perú',
      category: 'Cultura',
      rating: '4.9',
      imagePath: 'assets/images/post_card_machu_pichu.jpg',
    ),
    _FeaturedPlace(
      title: 'Cerro Monserrate',
      location: 'Bogotá, Colombia',
      category: 'Naturaleza',
      rating: '4.8',
      imagePath: 'assets/images/splash_mountain_background.jpg',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showPreviousPlace() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _showNextPlace() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Text(
            'Lugares destacados',
            style: TextStyle(
              color: Color(0xFF202522),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _places.length,
            onPageChanged: (page) => setState(() => _currentPage = page),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: _FeaturedPlaceCard(
                place: _places[index],
                onPrevious: _showPreviousPlace,
                onNext: _showNextPlace,
                showControls: _places.length > 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _places.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: index == _currentPage ? 18 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: index == _currentPage
                      ? const Color(0xFF1F5D50)
                      : const Color(0xFFDDE3DF),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FeaturedPlace {
  final String title;
  final String location;
  final String category;
  final String rating;
  final String imagePath;

  const _FeaturedPlace({
    required this.title,
    required this.location,
    required this.category,
    required this.rating,
    required this.imagePath,
  });
}

class _FeaturedPlaceCard extends StatelessWidget {
  final _FeaturedPlace place;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool showControls;

  const _FeaturedPlaceCard({
    required this.place,
    required this.onPrevious,
    required this.onNext,
    required this.showControls,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(place.imagePath, fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0xD9000000)],
                stops: [0.35, 1],
              ),
            ),
          ),
          Positioned(
            top: 14,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1F5D50),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                place.category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 14,
            right: 14,
            child: Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.bookmark_border,
                color: Color(0xFF1F5D50),
                size: 21,
              ),
            ),
          ),
          if (showControls)
            Positioned(
              left: 8,
              top: 102,
              child: _CarouselArrow(
                icon: Icons.chevron_left,
                onTap: onPrevious,
              ),
            ),
          if (showControls)
            Positioned(
              right: 8,
              top: 102,
              child: _CarouselArrow(icon: Icons.chevron_right, onTap: onNext),
            ),
          Positioned(
            left: 18,
            right: 18,
            bottom: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        place.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            place.location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFD166),
                            size: 16,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            place.rating,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF1F5D50),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CarouselArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CarouselArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.35),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(icon, color: Colors.white, size: 23),
        ),
      ),
    );
  }
}

class HomeSectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const HomeSectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF202522),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: const TextStyle(color: Color(0xFF707773), fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class HomeReviewCard extends StatelessWidget {
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

  const HomeReviewCard({
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFDDE3DF)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFFBBD7B0),
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: Color(0xFF202522),
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
                const Icon(Icons.more_horiz, color: Color(0xFF707773)),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0x61BBD7B0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$placeTitle · $placeLocation',
                style: const TextStyle(
                  color: Color(0xFF1F5D50),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: const Color(0xFFE9B949),
                  size: 18,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF202522),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(
                color: Color(0xFF424844),
                fontSize: 14,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.favorite_border,
                  size: 19,
                  color: Color(0xFF707773),
                ),
                const SizedBox(width: 5),
                Text(
                  likeCount,
                  style: const TextStyle(color: Color(0xFF707773)),
                ),
                const SizedBox(width: 18),
                const Icon(
                  Icons.mode_comment_outlined,
                  size: 18,
                  color: Color(0xFF707773),
                ),
                const SizedBox(width: 5),
                Text(
                  commentCount,
                  style: const TextStyle(color: Color(0xFF707773)),
                ),
                const Spacer(),
                const Icon(
                  Icons.share_outlined,
                  size: 18,
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
