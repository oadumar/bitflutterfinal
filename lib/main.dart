import 'package:cursoflutter/utils/firebaseController.dart' as firebaseAuth;
import 'package:cursoflutter/view/build_more.dart';
import 'package:cursoflutter/view/loginpage.dart';
import 'package:cursoflutter/view/news_page.dart';
import 'package:cursoflutter/view/recover.dart';
import 'package:cursoflutter/view/register.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CursoFlutter());
  firebaseAuth.Initializing();
}

class CursoFlutter extends StatefulWidget {
  @override
  _CursoFlutterState createState() => _CursoFlutterState();
}

class _CursoFlutterState extends State<CursoFlutter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => new Loginpage());
          case '/news':
            return MaterialPageRoute(builder: (context) => new NewsPage());
          case '/register':
            return MaterialPageRoute(builder: (context) => new RegisterUser());
          case '/recover':
            return MaterialPageRoute(builder: (context) => new RecoverUser());
          case '/more':
            return MaterialPageRoute(builder: (context) => new BuildMore());
          default:
            return null;
        }
      },
    );
  }
}
