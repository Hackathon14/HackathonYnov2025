import 'package:flutter/material.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Mon Application'),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      actions: [
        IconButton(
          icon: const Icon(Icons.dashboard),
          onPressed: () {
            Navigator.pushNamed(context, '/dashboard');
          },
        ),
        IconButton(
          icon: const Icon(Icons.table_chart),
          onPressed: () {
            Navigator.pushNamed(context, '/userstable');
          },
        ),
        IconButton(
          icon: const Icon(Icons.leaderboard),
          onPressed: () {
            Navigator.pushNamed(context, '/classement');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
