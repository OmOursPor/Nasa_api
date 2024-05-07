import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            // Premier widget aligné verticalement
            Center(
              child: Container(
                width: screenSize.width,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(222, 206, 202, 1),
                  borderRadius: BorderRadius.circular(20), // Rayon de bordure
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                      spreadRadius: 5, // Rayon de diffusion
                      blurRadius: 7, // Rayon de flou
                      offset: Offset(0, 3), // Décalage de l'ombre
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Titre du Conteneur',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Tableau sans bordure de deux colonnes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 8),
                              Text(
                                'Valeur 1',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Valeur 2'),
                              // Ajouter plus de valeurs si nécessaire
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 8),
                              Text('Valeur A'),
                              Text('Valeur B'),
                              // Ajouter plus de valeurs si nécessaire
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Espacement entre les deux widgets
            // Deuxième widget aligné verticalement
            Container(
              width: screenSize.width,
              height: 200,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black)),
                    ),
                    child: const Text(
                      'Conteneur 1',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black)),
                    ),
                    child: const Text(
                      'Conteneur 2',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  // Ajouter plus de conteneurs si nécessaire
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
