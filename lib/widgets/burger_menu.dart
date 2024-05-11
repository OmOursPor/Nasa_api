import 'package:flutter/material.dart';
import 'dart:convert'; // Importez le package 'dart:convert' pour utiliser JSON.decode
import 'package:http/http.dart' as http;


class BurgerMenu extends StatelessWidget {

  final int currentIndex; 
  final Function(int) onTap; // Ajoutez ce paramètre

  final void Function(int, Map<String, dynamic>) onDataReceived;

  const BurgerMenu({super.key, required this.currentIndex, required this.onTap, required this.onDataReceived});

Future<void> fetchData(int index) async {
    // Faites votre requête HTTP ici
    // Par exemple, utilisation de l'API 'jsonplaceholder.typicode.com'
    final String request;
    if(index == 0){
      request = 'https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=2000&api_key=HLrXf6YTmi4TX51J4ubonyJqwaQwBmyM4saRi1oX';
    }else if(index == 1){
      request = 'https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=5100&api_key=HLrXf6YTmi4TX51J4ubonyJqwaQwBmyM4saRi1oX';
    }else if(index == 2){
      request = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=4000&api_key=HLrXf6YTmi4TX51J4ubonyJqwaQwBmyM4saRi1oX';
    }else{
      request = '';
    }
    final response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      // Si la requête est réussie, parsez le JSON
      final Map<String, dynamic> data = json.decode(response.body);
      onDataReceived(index, data); // Appel de la fonction de rappel avec les données récupérées
    } else {
      // Si la requête a échoué, affichez l'erreur
      print('Erreur: ${response.statusCode}');
    }
  }

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
              onTap(0);
              fetchData(0);
              Navigator.pop(context);
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
              onTap(1);
              fetchData(1);
              Navigator.pop(context);            },
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
              onTap(2);
              fetchData(2);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
