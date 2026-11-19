import 'package:flutter/material.dart';

class WayspotBottomBar extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback? onExploreTap;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onHomeTap;
  final VoidCallback? onProfileTap;

  const WayspotBottomBar({
    super.key,
    required this.selectedIndex,
    this.onExploreTap,
    this.onNotificationsTap,
    this.onHomeTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFDDE3DF), width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              Expanded(
                child: _WayspotNavItem(
                  icon: selectedIndex == 0 ? Icons.map : Icons.map_outlined,
                  semanticLabel: 'Mapa y exploración',
                  isSelected: selectedIndex == 0,
                  onTap: onExploreTap,
                ),
              ),
              Expanded(
                child: _WayspotNavItem(
                  icon: selectedIndex == 1
                      ? Icons.notifications
                      : Icons.notifications_none,
                  semanticLabel: 'Notificaciones',
                  isSelected: selectedIndex == 1,
                  onTap: onNotificationsTap,
                ),
              ),
              Expanded(
                child: _WayspotNavItem(
                  icon: selectedIndex == 2 ? Icons.home : Icons.home_outlined,
                  semanticLabel: 'Inicio',
                  isSelected: selectedIndex == 2,
                  onTap: onHomeTap,
                ),
              ),
              Expanded(
                child: _WayspotNavItem(
                  icon: selectedIndex == 3
                      ? Icons.person
                      : Icons.person_outline,
                  semanticLabel: 'Perfil',
                  isSelected: selectedIndex == 3,
                  onTap: onProfileTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WayspotNavItem extends StatelessWidget {
  final IconData icon;
  final String semanticLabel;
  final bool isSelected;
  final VoidCallback? onTap;

  const _WayspotNavItem({
    required this.icon,
    required this.semanticLabel,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      selected: isSelected,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Center(
          child: Container(
            width: 52,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0x4DBBD7B0) : Colors.transparent,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Icon(
              icon,
              size: 22,
              color: isSelected
                  ? const Color(0xFF1F5D50)
                  : const Color(0xFF707773),
            ),
          ),
        ),
      ),
    );
  }
}

class WayspotAddButton extends StatelessWidget {
  const WayspotAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: const Color(0xFF1F5D50),
      foregroundColor: Colors.white,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}
