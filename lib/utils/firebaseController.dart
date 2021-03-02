import 'package:cursoflutter/view/widgets/dialog_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void Initializing() async {
  await Firebase.initializeApp();
}

void stateFirebase(context) {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    print('User -- $user --');
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
      Navigator.pushNamed(context, '/news');
    }
  });
}

void signIn({@required email, @required password, @required context}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    print(e.code);
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      showDialog(
        context: context,
        barrierDismissible:
            false, //  no cierra el modal hasta que se le instruya que lo haga.
        builder: (_) => AlertDialog(
          title: Text('Alerta !!!'), // Para mostrar el título del alerta
          content: Text('El correo ingresado no está registrado.'),
          actions: [
            DialogButton(
              texto: 'OK',
              onPressed: () => [
                Navigator.pop(context),
                Navigator.pushNamed(context, '/login'),
              ],
              ancho: 90.0,
            ),
          ],
        ),
      );
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      showDialog(
        context: context,
        barrierDismissible:
            false, //  no cierra el modal hasta que se le instruya que lo haga.
        builder: (_) => AlertDialog(
          title: Text('Alerta !!!'), // Para mostrar el título del alerta
          content: Text('Error en la contraseña ingresada.'),
          actions: [
            DialogButton(
              texto: 'OK',
              onPressed: () => [
                Navigator.pop(context),
                Navigator.pushNamed(context, '/login'),
              ],
              ancho: 90.0,
            ),
          ],
        ),
      );
    }
  }
}

void signUp({@required email, @required password, @required context}) async {
  print('Nmail -> ' + email + ' Npass -> ' + password);
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    print(e.code);
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      showDialog(
        context: context,
        barrierDismissible:
            false, //  no cierra el modal hasta que se le instruya que lo haga.
        builder: (_) => AlertDialog(
          title: Text('Alerta !!!'), // Para mostrar el título del alerta
          content: Text('La contraseña ingresada es muy debil.'),
          actions: [
            DialogButton(
              texto: 'OK',
              onPressed: () => [
                Navigator.pop(context),
                Navigator.pushNamed(context, '/register'),
              ],
              ancho: 90.0,
            ),
          ],
        ),
      );
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      showDialog(
        context: context,
        barrierDismissible:
            false, //  no cierra el modal hasta que se le instruya que lo haga.
        builder: (_) => AlertDialog(
          title: Text('Alerta !!!'), // Para mostrar el título del alerta
          content: Text('El correo ingresado ya está registrado.'),
          actions: [
            DialogButton(
              texto: 'OK',
              onPressed: () => [
                Navigator.pop(context),
                Navigator.pushNamed(context, '/register'),
              ],
              ancho: 90.0,
            ),
          ],
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}

void signOut({@required context}) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushNamed(context, '/login');
}

void recoverUser({@required email, @required context}) async {
  print('Rmail -> ' + email);
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    );
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Notificación !!!'), // Para mostrar el título del alerta
        content: Text(
            'Hemos enviado un correo a su cuenta para que recupere su contraseña.'),
        actions: [
          DialogButton(
            texto: 'OK',
            onPressed: () => [
              Navigator.pushNamed(context, '/login'),
            ],
            ancho: 90.0,
          ),
        ],
      ),
    );
  } on FirebaseAuthException catch (e) {}
}

/*
void recoverUser(@required email, context) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
*/
