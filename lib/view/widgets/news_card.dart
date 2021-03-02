import 'package:cursoflutter/model/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final Function(News) onTapFav;

  const NewsCard({Key key, @required this.news, this.onTapFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: MediaQuery.of(context).size.height / 1.72,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              color: Colors.black12,
            ),
          ]),
      child: Column(
        children: [
          //  Contenedor para la imagen y sus características
          Container(
            margin: EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: news.urlToImage != null
                    ? NetworkImage(news.urlToImage)
                    : AssetImage('asset/img/backbit.jpeg'),
              ),
            ),
          ),

          Flexible(
            // Contenedor para los textos y sus caracteristicas.
            child: Container(
              padding: EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  Widget para mostrar el titulo
                  Text(
                    news.title ?? 'Título no disponible',
                    maxLines: 3,
                    style: GoogleFonts.signika(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  // Widget para mostrar el autor
                  Text(
                    news.author ?? 'Autor no disponible',
                    style: GoogleFonts.signika(
                      fontSize: 14,
                      color: Colors.black45,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  //  Widget para abrir un espacio
                  /*
                  Padding(
                    padding: EdgeInsets.all(2),
                  ),
                  */

                  Container(
                    height: 5,
                  ),

                  //  Widget para mostrar la descripción de la noticia.
                  Text(
                    news.description ?? 'Descripción no disponible',
                    maxLines: 3,
                    style: GoogleFonts.signika(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //  Container de la barra debajo de los textos
          Container(
            margin: EdgeInsets.only(
              right: 13,
              left: 10,
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    onPressed: () {
                      onTapFav(news);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/more');
                    },
                    child: Text(
                      'MORE > ',
                      style: GoogleFonts.signika(
                        fontSize: 14,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
