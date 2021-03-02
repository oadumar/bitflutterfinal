import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BitButton extends StatelessWidget {
  final String texto;
  final Function onPressed;
  final double width;
  final double height;
  final double fontSize;

  const BitButton({
    Key key,
    @required this.texto, //  Para hacer obligatorio
    @required this.onPressed, //  Para hacerlo obligatorio
    this.width = 200, //  Para asignar un valor defecto por si no se pasa
    this.height,
    this.fontSize = 24, // Para asignar valor default si no se envia.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20,
          ),
        ],
      ),
      child: FlatButton(
        minWidth: width,
        child: Text(
          texto,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
