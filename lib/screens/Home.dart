// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/detail.dart';

class Home extends StatelessWidget {
  final int currentIndex;
  final Map<String, dynamic>? data;

  const Home({super.key, required this.currentIndex, this.data});

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
                        color:
                            Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                        spreadRadius: 5, // Rayon de diffusion
                        blurRadius: 7, // Rayon de flou
                        offset: const Offset(0, 3), // Décalage de l'ombre
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(child: getTitle(currentIndex)),
                      const SizedBox(height: 16),
                      // Tableau sans bordure de deux colonnes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Expanded(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 8),
                                Text(
                                  'Landing date :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Launch date :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Mission status :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Max sol :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Max date :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Total photos :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(data != null && data!.containsKey('photos')
                                    ? '${data?['photos'][0]['rover']['landing_date']}'
                                    : 'No Data'),
                                Text(data != null && data!.containsKey('photos')
                                    ? '${data?['photos'][0]['rover']['launch_date']}'
                                    : 'No Data'),
                                Text(data != null && data!.containsKey('photos')
                                    ? '${data?['photos'][0]['rover']['status']}'
                                    : 'No Data'),
                                Text(data != null && data!.containsKey('photos')
                                    ? '${data?['photos'][0]['rover']['max_sol']}'
                                    : 'No Data'),
                                Text(data != null && data!.containsKey('photos')
                                    ? '${data?['photos'][0]['rover']['max_date']}'
                                    : 'No Data'),
                                Text(data != null && data!.containsKey('photos')
                                    ? '${data?['photos'][0]['rover']['total_photos']}'
                                    : 'No Data'),
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
            SizedBox(
              width: screenSize.width,
              height: 450,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  if (data != null && data!.containsKey('photos')) ...[
                    for (var photo in data?['photos']) ...[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(rover: photo['rover']['name'], sol: photo['sol'].toString())
                        ),
                      );
                    },
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.black)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Sol ${photo['sol']}',
                                style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'On ${photo['earth_date']}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(
                                '${photo['rover']['total_photos']}',
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          )),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTitle(int index) {
    switch (index) {
      case 0:
        return const Text(
          'Spirit',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        );
      case 1:
        return const Text(
          'Opportunity',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        );
      case 2:
        return const Text(
          'Curiosity',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        );
      default:
        return const Text(
          '@Title',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        );
    }
  }
}
