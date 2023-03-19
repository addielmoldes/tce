import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'TCE',
    home: Home(),
  ));
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
          child: ListView(children: const <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/images/test.jpg'),
                    fit: BoxFit.cover)),
            child: null),
        ListTile(
          leading: Icon(Icons.menu_book),
          title: Text('Contenido'),
        ),
        ListTile(
          leading: Icon(Icons.fact_check),
          title: Text('Evaluar'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Info'),
        )
      ])),
      body: ListView(
        children: <Widget>[
          customCard(
              'assets/images/test.jpg', 'Contenido 1', 'Explicacion breve'),
          customCard(
              'assets/images/test.jpg', 'Contenido 2', 'Explicacion breve'),
          customCard(
              'assets/images/test.jpg', 'Contenido 3', 'Explicacion breve')
        ],
      ),
    );
  }
}

Widget customCard(String imgPath, text, subText) {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Image.asset(imgPath),
          title: Text(text),
          subtitle: Text(subText),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            TextButton(onPressed: null, child: Text('LEER MÁS'))
          ],
        )
      ],
    ),
  );
}

Widget customDrawerText() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Row(
        children: const <Widget>[
          Text(
            'Menu',
            textAlign: TextAlign.start,
          )
        ],
      )
    ],
  );
}
