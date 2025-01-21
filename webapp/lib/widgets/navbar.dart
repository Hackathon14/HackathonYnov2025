import 'package:flutter/material.dart';
import 'package:webapp/features/dashboard/dashboard_page.dart';
import 'package:webapp/features/user_table/userstable_page.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[900],
      actions: [
        NavbarButton(
          label: 'Dashboard',
          icon: Icons.dashboard,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
        ),
        NavbarButton(
          label: 'Liste des utilisateurs',
          icon: Icons.table_chart,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsersTable()),
            );
          },
        ),
        NavbarButton(
          label: 'Classement',
          icon: Icons.leaderboard,
          onTap: () {
            // Naviguer vers la page de classement (à créer ultérieurement)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content:
                      Text("Page de classement en cours de développement")),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NavbarButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const NavbarButton({
    required this.label,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextButton.icon(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          label: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
