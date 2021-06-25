import 'package:comics/controllers/user_provider.dart';
import 'package:comics/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  static const String routeName = 'setting/';
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserProvider>(context);
    final user = users.listUser.first;

    Future<Null> logout() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('idUser', null);

      Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                LoginScreen(),
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
          (route) => false);
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.red.withOpacity(0.02),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                   BackButton(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person, color: Colors.white, size: 42,),
                      backgroundColor: Colors.amber,
                      radius: 55,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.3,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Profil',
                      // style: GoogleFonts.quicksand(
                      //   fontSize: 18,
                      // ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  profilItem(
                    'Votre nom',
                    subTitle: user.nomUser,
                  ),
                  profilItem(
                    'Votre email',
                    subTitle: user.emailUser == null
                        ? 'Non renseignée'
                        : user.emailUser,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                margin: EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.3,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Compte',
                      // style: GoogleFonts.quicksand(
                      //   fontSize: 18,
                      // ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  profilItemWithIcon(
                    'Solde',
                    Icons.payment_rounded,
                    subTitle: user.pointUser,
                  ),
                  profilItemWithIcon(
                    'Mot de passe',
                    Icons.lock,
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => EditPassWord(userId),
                      //   ),
                      // );
                    },
                    subTitle: '*********',
                    trailing: Icons.arrow_forward_ios,
                  ),
                  profilItemWithIcon(
                    'Email',
                    Icons.mail,
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => EditEmail(userId),
                      //   ),
                      // );
                    },
                    subTitle: '',
                    trailing: Icons.arrow_forward_ios,
                  ),
                  profilItemWithIcon(
                    'Numero',
                    Icons.call,
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => EditNumber(userId),
                      //   ),
                      // );
                    },
                    subTitle: user.numUser,
                    trailing: Icons.arrow_forward_ios,
                  ),
                  profilItemWithIcon(
                    'Deconnexion',
                    Icons.lock_open_outlined,
                    //trailing: Icons.arrow_right,
                    subTitle: '',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Confirmez'),
                          content: Text('Vous allez vous deconnecter !'),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                              child: Text('Non'),
                            ),
                            FlatButton(
                              onPressed: () {
                                logout();
                              },
                              child: Text('oui'),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

profilItem(
  String title, {
  String subTitle,
  Function onTap,
  IconData icon,
  Widget trailing,
  Color color,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          width: 0.3,
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          //style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        ),
        Text(
          subTitle,
          //style: GoogleFonts.quicksand(),
        ),
      ],
    ),
  );
}

profilItemWithIcon(
  String title,
  IconData icon, {
  Function onTap,
  String subTitle,
  IconData trailing,
  Color color,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.3,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey[600],
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            //style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            subTitle,
            //style: GoogleFonts.quicksand(fontSize: 16),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            trailing,
            size: 14,
            color: Colors.red,
          ),
        ],
      ),
    ),
  );
}
