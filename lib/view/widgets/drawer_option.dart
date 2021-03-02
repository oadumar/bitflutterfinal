import 'package:flutter/material.dart';
import '../../utils/styles.dart';

class DrawerOption extends StatelessWidget {

  final String text;
  final Function onTap;

  const DrawerOption({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.list),
      title: Text(
        '$text',
        style: EstTex.draOptM,
      ),
    );
  }
}
