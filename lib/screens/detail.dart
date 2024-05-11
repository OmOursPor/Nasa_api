import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage extends StatefulWidget {
  final String sol;
  final String rover;

  DetailPage({required this.sol, required this.rover});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = true;
  String page = "1";
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final String request =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/${widget.rover.toLowerCase()}/photos?sol=${widget.sol}&page=${page}&api_key=HLrXf6YTmi4TX51J4ubonyJqwaQwBmyM4saRi1oX';
    final response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      // Exemple de récupération de l'URL de la première photo
      if (data?['photos'] != null && data?['photos'].isNotEmpty) {
        setState(() {
          data = data;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Aucune image trouvée'),
              content: Text(
                  'Il n\'y a pas d\'images disponibles pour le sol ${widget.sol} du rover ${widget.rover}.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: const Text(
                'Une erreur s\'est produite lors du chargement des données.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> fetchOnPress(String action) async {
    final String request;
    if (action == "prev") {
      request =
          'https://api.nasa.gov/mars-photos/api/v1/rovers/${widget.rover.toLowerCase()}/photos?sol=${widget.sol}&page=1&api_key=HLrXf6YTmi4TX51J4ubonyJqwaQwBmyM4saRi1oX';
    } else {
      request =
          'https://api.nasa.gov/mars-photos/api/v1/rovers/${widget.rover.toLowerCase()}/photos?sol=${widget.sol}&page=2&api_key=HLrXf6YTmi4TX51J4ubonyJqwaQwBmyM4saRi1oX';
    }
    final response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      setState(() {
        // Mettre à jour les données avec les nouvelles données obtenues
        data = data;
        isLoading = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erreur'),
            content: const Text(
                'Une erreur s\'est produite lors du chargement des données pour le bouton 1.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${widget.rover} sol ${widget.sol} photos'),
          backgroundColor: Colors.deepOrange),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : data != null
                      ? ListView(
                          children: [
                            Center(
                              child: Text("Page ${page}/2"),
                            ),
                            for (var photo in data?['photos'])
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(photo['img_src']),
                                  ),
                                ],
                              )
                          ],
                        )
                      : const SizedBox
                          .shrink(), // Si aucune image n'est trouvée, ne rien afficher
            ),
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Alignement des boutons
            children: [
              ElevatedButton(
                onPressed: () {
                  isLoading = true;
                  fetchOnPress("prev");
                },
                child: const Text('Previous',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ElevatedButton(
                onPressed: () {
                  isLoading = true;
                  fetchOnPress("next");
                },
                child: const Text('Next',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
