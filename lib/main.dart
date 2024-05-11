import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/widgets/burger_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mars Rover Photos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentIndex = 0; // Index Par defaut du drawer
  Map<String, dynamic>? _data;

  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onDataReceived(int index, Map<String, dynamic> data){
    setState(() {
      _data = data;
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu), // Icône du menu burger
              onPressed: () {
                Scaffold.of(context)
                    .openDrawer(); // Action à effectuer lorsque le bouton du menu est pressé
              },
            );
          },
        ),
      ),
      drawer: BurgerMenu(
        currentIndex: currentIndex,
        onDataReceived: onDataReceived, onTap: (int ) {  },
      ),
      body: Home(currentIndex: currentIndex, data: _data),
    );
  }
}
