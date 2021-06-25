import 'dart:convert';
import 'dart:io';

import 'package:comics/models/HTTPResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 

class RegisterForm extends StatefulWidget {
  static const routeName = 'register/';
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _keyLoader = GlobalKey<State>();
  final _userNameCtrl = TextEditingController();
  final _userNumbCtrl = TextEditingController();
  final _userEmailCtrl = TextEditingController();
  final _userPassCtrl = TextEditingController();

  Future createUser() async {
    try {
      //showLoadingDialog(context, _keyLoader);
      final response = await http.post(
        'http://bad-event.com/ncomic/dataHandling/addUsers.php',
        body: {
          'nomUser': _userNameCtrl.text,
          'emailUser': _userEmailCtrl.text,
          'numUser': _userNumbCtrl.text,
          'passUser': _userPassCtrl.text,
        },
      );
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print('ook');
      } else {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Identifiants incorrects',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        );
      }
      //
    } on SocketException {
      return HTTPResponse(false, null,
          message: 'Vérifier votre connexion internet');
    } on FormatException {
      return HTTPResponse(false, null,
          message: 'Mauvaise réponse du server, réessayez');
    } catch (e) {
      return HTTPResponse(false, null,
          message: 'Une erreur est survenue, réessayez');
    }
  }

  Future<void> showLoadingDialog(BuildContext context, GlobalKey key) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            backgroundColor: Colors.black54,
            children: <Widget>[
              Center(
                child: Column(children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Inscription...",
                    style: TextStyle(color: Colors.blueAccent),
                  )
                ]),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              ),
                              shape: StadiumBorder(),
                              color: Colors.black,
                              elevation: 0.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(13),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                )),
                            child: Text(
                              'Inscription',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _userNameCtrl,
                            decoration: InputDecoration(
                              hintText: 'Nom complet',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _userNumbCtrl,
                            decoration: InputDecoration(
                              hintText: 'Numero de tel',
                              prefixIcon: Icon(Icons.call),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _userEmailCtrl,
                            decoration: InputDecoration(
                              hintText: 'Adresse mail',
                              prefixIcon: Icon(Icons.mail_outline_rounded),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _userPassCtrl,
                            decoration: InputDecoration(
                              hintText: 'Mot de passe',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  createUser();
                                },
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Inscrivez-vous',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                color: Theme.of(context).primaryColor,
                                elevation: 0.0,
                                padding: EdgeInsets.all(16),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text('CGV, CGU', style: TextStyle(color: Colors.blueAccent),)
                            ],
                          ),
                        ),
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
