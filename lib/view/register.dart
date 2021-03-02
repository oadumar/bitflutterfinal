import 'package:cursoflutter/utils/firebaseController.dart' as firebaseAuth;
import 'package:cursoflutter/utils/resize.dart';
import 'package:cursoflutter/view/widgets/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool verPsw = false;
  TextEditingController _textEdControlEmail = new TextEditingController();
  TextEditingController _textEdControlPsw = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.only(top: 40, left: 25, right: 25),
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              height: 100,
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Wellcome to",
                    style: GoogleFonts.signika(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: resH(medH: _width, size: 15),
                    ),
                  ),

                  //  Widget imagen
                  Image.asset(
                    'assets/img/logobit.png',
                    width: resH(medH: _width, size: 157),
                    height: resV(medV: _height, size: 55),
                    fit: BoxFit.contain,
                  ),

                  //  Widget texto
                  Text(
                    'Create your account to login',
                    style: GoogleFonts.signika(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: resH(medH: _width, size: 15),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  //Email Field
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(90)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 5)
                        ],
                      ),
                      child: TextField(
                        controller: _textEdControlEmail,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: GoogleFonts.signika(
                              fontSize: 18,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                  ),

                  //Password Field
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(90)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 5)
                        ],
                      ),
                      child: TextField(
                        obscureText: verPsw == false ? true : false,
                        controller: _textEdControlPsw,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: GoogleFonts.signika(
                                fontSize: 18,
                                color: Colors.black45,
                                fontWeight: FontWeight.normal),
                            icon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(verPsw == false
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined),
                              onPressed: () {
                                setState(() {
                                  verPsw = !verPsw;
                                });
                              },
                            )),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  //Sign Up Button
                  Center(
                    child: DecoratedBox(
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
                        minWidth: 300,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          if (_textEdControlEmail.text.isEmpty ||
                              _textEdControlPsw.text.isEmpty) {
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, //  no cierra el modal hasta que se le instruya que lo haga.
                              builder: (_) => AlertDialog(
                                title: Text(
                                    'Alerta !!!'), // Para mostrar el título del alerta
                                content: Text(
                                    'No ha ingresado los datos de registro. Ingréselos para continuar.'),
                                actions: [
                                  DialogButton(
                                    texto: 'OK',
                                    onPressed: () => Navigator.pop(context),
                                    ancho: 90.0,
                                  ),
                                ],
                              ),
                            );
                          } else {
                            setState(() {
                              firebaseAuth.signUp(
                                email: _textEdControlEmail.text,
                                password: _textEdControlPsw.text,
                                context: context,
                              );
                              firebaseAuth.stateFirebase(context);
                            });
                          }
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  /*

                  Center(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            firebaseAuth.signUp(
                              email: _textEdControlEmail.text,
                              password: _textEdControlPsw.text,
                              context: context,
                            );
                            firebaseAuth.stateFirebase(context);
                          });
                        },
                        hoverColor: Colors.red,
                        focusColor: Colors.red,
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 12)
                            ],
                          ),
                          child: Center(
                              child: Text("Sign Up",
                                      style: GoogleFonts.signika(
                                          fontSize: 18,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold))                                 ,
                        )),
                  ),
                  */

                  SizedBox(
                    height: 20,
                  ),

                  Center(
                    child: DecoratedBox(
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
                        minWidth: 300,
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
