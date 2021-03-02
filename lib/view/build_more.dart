import 'package:flutter/material.dart';

class BuildMore extends StatelessWidget {
  final int intNews;

  const BuildMore({Key key, this.intNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black38,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'View News Detail',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/news');
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
