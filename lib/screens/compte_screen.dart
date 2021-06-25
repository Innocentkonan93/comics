import 'dart:math';

import 'package:comics/controllers/cat_provider.dart';
import 'package:comics/controllers/user_provider.dart';
import 'package:comics/screens/coinshop_screen.dart';
import 'package:comics/services/api_helpers.dart';
import 'package:comics/widgets/setting.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompteScreen extends StatefulWidget {
  const CompteScreen({Key key}) : super(key: key);
  @override
  _CompteScreenState createState() => _CompteScreenState();
}

class _CompteScreenState extends State<CompteScreen> {
  double _value = 0.5;
  PhoneNumber number = PhoneNumber(isoCode: 'CI');

  String idUser;
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  _getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String prefIdUser = prefs.getString('idUser');
    var provider = Provider.of<UserProvider>(context, listen: false);
    var resp = await AllUser.getUsers(prefIdUser);
    if (resp.isSuccesful) {
      provider.setUserList(resp.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserProvider>(context).listUser;
    final user = users.first;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: _height * 0.13,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      'Compte',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/images/coin.png'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      user.pointUser,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(CoinshopScreen.routeName);
                      },
                      child: Text(
                        'Acheter',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).accentColor,
                        elevation: 7,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 25,
                                ),
                                Text(
                                  'Recherche',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 17,
                                    color: Colors.red[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Setting.routeName);
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    size: 25,
                                  ),
                                  Text(
                                    'Paramètres',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.red[400],
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
