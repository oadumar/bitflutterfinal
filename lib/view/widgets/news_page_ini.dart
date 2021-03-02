import 'package:cursoflutter/presenter/build_view_nomuestra.dart';
import 'package:cursoflutter/utils/styles.dart';
import 'package:flutter/material.dart';

//  Este archivo contiene el muestreo del listado de opciones del drawer con el desarrollo original
//  Es decir, incluyendo los elementos en Padding.

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int newsInt = 1;
  String viewName = 'NewsList';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black38,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'BIT News',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white54,

                /* Opcion para insertar imagen local*/
                child: Image.asset(
                  'assets/img/icp.png',
                ), /* Fin opción para insertar imagen local*/
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  newsInt = 1;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ' > All articles mentioning Apple from yesterday, sorted by popular publishers first.',
                  style: EstTex.draOptM,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  newsInt = 2;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ' > All articles about Tesla from the last month, sorted by recent first.',
                  style: EstTex.draOptM,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  newsInt = 3;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ' > Top business headlines in the US right now.',
                  style: EstTex.draOptM,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  newsInt = 4;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ' > Top headlines from TechCrunch right now.',
                  style: EstTex.draOptM,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  newsInt = 5;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ' > All articles published by the Wall Street Journal in the last 6 months, sorted by recent first.',
                  style: EstTex.draOptM,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        child: BuildView(viewName: viewName, intNews: newsInt),
      ),
    );
  }
}

/*  Opción para traer imgen de internet
    Se ubica como child de DrawerHeader
                Image.network(
                  'https://bit.institute/images/Instituto-Cursos-Programacion.png',
                ),
                Fin opción para traer imgen de internet  */
