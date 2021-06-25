import 'dart:convert';
import 'dart:io';

import 'package:comics/connectivity/connectivity_provider.dart';
import 'package:comics/controllers/user_provider.dart';
import 'package:comics/models/HTTPResponse.dart';
import 'package:comics/screens/tab_screen.dart';
import 'package:comics/services/api_helpers.dart';
import 'package:comics/widgets/login/register_form.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  static const routeName = 'login-form';
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _keyLoader = GlobalKey<State>();
  final _userNumbCtrl = TextEditingController();
  final _userPassCtrl = TextEditingController();
  String userId = '';

  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  Future loginUser() async {
    try {
      showLoadingDialog(context, _keyLoader);
      final response = await http.post(
          'http://bad-event.com/ncomic/dataHandling/loginUsers.php',
          body: {
            'numUser': _userNumbCtrl.text,
            'passUser': _userPassCtrl.text,
          });
      var dataUser = json.decode(response.body);
      if (dataUser.length == 1) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
              opacity: animation,
              child: UserTabScreen(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 0.1);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
        userId = dataUser[0]['idUser'];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('idUser', userId);
        print(userId);
        _getUsers();
      } else {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Identifiants incorrects',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
          ),
        );
        _userPassCtrl.clear();
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

  void _getUsers() async {
    var provider = Provider.of<UserProvider>(context, listen: false);
    var resp = await AllUser.getUsers(userId);
    if (resp.isSuccesful) {
      provider.setUserList(resp.data);
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
                  CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Connexion....",
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

  void _showInternetStatus() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.wifi_off_sharp,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Aucune connexion internet'),
          ],
        ),
        duration: Duration(seconds: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(),
            // padding: EdgeInsets.symmetric(horizontal: 18),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                        child: Text(
                          'Connexion',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _userNumbCtrl,
                          decoration: InputDecoration(
                            hintText: 'Votre numéro de tel',
                            prefixIcon: Icon(Icons.person),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _userPassCtrl,
                          decoration: InputDecoration(
                            hintText: 'Votre mot de passe',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Consumer<ConnectivityProvider>(
                              builder: (context, internet, child) =>
                                  ElevatedButton(
                                // onPressed: internet.isOnline == true
                                //     ? loginUser
                                //     : _showInternetStatus,

                                onPressed: loginUser,
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  width: double.infinity,
                                  child: Text(
                                    'Connexion',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextButton(
                              child: Text(
                                'Créer un compte ?',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              onPressed: () {
                                // Navigator.of(context).pop();
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        RegisterForm(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = Offset(0.0, 0.1);
                                      var end = Offset.zero;
                                      var tween = Tween(begin: begin, end: end);
                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                            )
                          ],
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
