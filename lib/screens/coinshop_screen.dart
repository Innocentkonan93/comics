import 'package:comics/controllers/user_provider.dart';
import 'package:comics/services/api_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CoinshopScreen extends StatefulWidget {
  static const routeName = 'coinshop/';

  @override
  _CoinshopScreenState createState() => _CoinshopScreenState();
}

class _CoinshopScreenState extends State<CoinshopScreen> {
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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Coins Boutique',
          style: TextStyle(color: Colors.red),
        ),
        // elevation: 0.0,
      ),
      body: Container(
        height: _height,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: _height * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: Colors.black12,
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: _height * 0.6,
              color: Colors.white,
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.monetization_on_outlined),
                    title: Text('10 coins'),
                    trailing: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.amber,
                      child: Text('\$ 0.99 '),
                    ),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.monetization_on_outlined),
                    title: Text('20 coins'),
                    trailing: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.amber,
                      child: Text('\$ 1.99 '),
                    ),
                    onTap: (){
                      //makeCall('http://flutter.dev');
                    },
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.monetization_on_outlined),
                    title: Text('50 coins'),
                    trailing: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.amber,
                      child: Text('\$ 2.99 '),
                    ),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.monetization_on_outlined),
                    title: Text('100 coins'),
                    trailing: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.amber,
                      child: Text('\$ 4.99 '),
                    ),
                  ),
                  Divider(height: 0.5),
                  SizedBox(height: 30),
                  Container(
                    height: _height * 0.3,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Achetant, vous accepter les conditions générale de vente et d\'utilisation.',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
