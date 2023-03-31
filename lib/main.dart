import 'package:flutter/material.dart';
import 'package:tce/content/content.dart';
import 'package:tce/info.dart';

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
      title: 'Evaluación Neurológica',
      home: const Home(),
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blueGrey,
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
        title: const Text('Evaluación Neurológica'),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Info(),
              ),
            ),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
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
            'assets/images/signs.JPG',
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
              fit: BoxFit.fill,
              filterQuality: FilterQuality.none,
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
