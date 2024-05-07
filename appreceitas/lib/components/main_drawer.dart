import 'package:appreceitas/utils/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 16,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Vamos Cozinhar?',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _createItem(
              Icons.restaurant,
              'Refeições',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            ),
            _createItem(
              Icons.settings,
              'Configurações',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
            ),
          ],
        ),
    );
  }
}
