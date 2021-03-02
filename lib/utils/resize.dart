import 'package:flutter/material.dart';

//  Metodo para proporcionar la altura
double resH({@required double medH, @required double size}) {
  /*
  La propuesta que debería funcionar para altura
  var scale = 1 / medH;
  var eny = scale * size;
  return eny;
  */
  var result = medH / size;
  return medH / result;
}

//  Metodo para proporcionar la anchura
double resV({@required double medV, @required double size}) {
  /*
  La propuesta que deberia funcionar para ancho
  var scale = 1 / medV;
  var enx = scale * size;
  return enx;
   */
  var result = medV / size;
  return medV / result;
}

/*
double rsh ({@required double size}) {
  var ancho = MediaQuery.of(context).size.height;
  var result = ancho / size;
  return ancho / result;
}
*/
