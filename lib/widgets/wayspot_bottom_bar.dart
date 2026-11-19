import 'package:flutter/material.dart';

class WayspotBottomBar extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onProfileTap;

  const WayspotBottomBar({
    super.key,
    required this.selectedIndex,
    this.onNotificationsTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFDDE3DF),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              Expanded(
                child: _WayspotNavItem(
                  icon: Icons.search,
                  label: 'Explorar',
                  isSelected: selectedIndex == 0,
                  onTap: () {},
                ),
              ),
              Expanded(
                child: _WayspotNavItem(
                  icon: selectedIndex == 1
                      ? Icons.notifications
                      : Icons.notifications_none,
                  label: 'Notificaciones',
                  isSelected: selectedIndex == 1,
                  onTap: onNotificationsTap,
                ),
              ),
              Expanded(
                child: _WayspotNavItem(
                  icon: selectedIndex == 2 ? Icons.home : Icons.home_outlined,
                  label: 'Inicio',
                  isSelected: selectedIndex == 2,
                  onTap: () {},
                ),
              ),
              Expanded(
                child: _WayspotNavItem(
                  icon: selectedIndex == 3
                      ? Icons.person
                      : Icons.person_outline,
                  label: 'Perfil',
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
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const _WayspotNavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0x4DBBD7B0)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              size: 22,
              color: isSelected
                  ? const Color(0xFF1F5D50)
                  : const Color(0xFF707773),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF1F5D50)
                  : const Color(0xFF707773),
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
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
