import 'package:flutter/material.dart';
import '../../utils/styles.dart';

class DialogButton extends StatelessWidget {

  final String texto;
  final Function onPressed;
  final double ancho;

  const DialogButton({Key key, this.texto, this.onPressed, this.ancho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FlatButton(
        onPressed: onPressed,
        minWidth: ancho,
        child: Text(
          texto,
          style: EstTex.estBotP,
        ),
      ),
    );
  }
}
