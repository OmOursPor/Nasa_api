import 'package:flutter/material.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 250, 240, 242),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/rocket.png', // Chemin de ton image PNG
                  width: 40, // Largeur de l'image
                  height: 40, // Hauteur de l'image
                  color: Colors.pink,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Mars Rovers',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'Spirit',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            onTap: () {
              // Action à effectuer lorsque l'option 1 est sélectionnée
            },
          ),
          ListTile(
            title: const Text(
              'Opportunity',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            onTap: () {
              // Action à effectuer lorsque l'option 2 est sélectionnée
            },
          ),
          ListTile(
            title: const Text(
              'Curiosity',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            onTap: () {
              // Action à effectuer lorsque l'option 2 est sélectionnée
            },
          ),
        ],
      ),
    );
  }
}
