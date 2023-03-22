import 'package:flutter/material.dart';
import 'package:tce/info.dart';
import 'package:tce/content/content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCE',
      home: const Home(),
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.green,
        // colorScheme: const ColorScheme.dark(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contenido'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/test.jpg'),
                        fit: BoxFit.cover)),
                child: null),
            const ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('Contenido'),
            ),
            const ListTile(
              leading: Icon(Icons.fact_check),
              title: Text('Evaluar'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Información'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Info(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 3.0,
        children: <Widget>[
          customCard(
            'assets/images/consc.JPG',
            'Nivel de conciencia',
            context,
            const Content(),
          ),
          customCard(
            'assets/images/pupil.JPG',
            'Pupilas',
            context,
            const Content(),
          ),
          customCard(
            'assets/images/test.jpg',
            'Signos irritativos',
            context,
            const Content(),
          ),
          customCard(
            'assets/images/test.jpg',
            'Focalidad motora',
            context,
            const Content(),
          ),
          customCard(
            'assets/images/test.jpg',
            'Otros',
            context,
            const Content(),
          ),
        ],
      ),
    );
  }
}

Widget customCard(imgPath, title, context, route) {
  return Card(
    elevation: 2,
    child: GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
      ),
      child: GridTile(
        footer: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            color: Color.fromARGB(175, 0, 0, 0),
          ),
          padding: const EdgeInsets.all(4.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              // fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgPath),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    ),
  );
}
