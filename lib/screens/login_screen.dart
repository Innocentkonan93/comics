import 'package:comics/connectivity/connectivity_provider.dart';
import 'package:comics/widgets/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login-screen/';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  @override
  void initState() {
   
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    // final _height = MediaQuery.of(context).size.height;
    // final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<ConnectivityProvider>(
        builder: (context, internet, child) {
          return Center(
            child: LoginForm(),
          );
        },
      ),
    );
  }
}
