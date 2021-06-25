import 'package:comics/controllers/Bd_provider.dart';
import 'package:comics/controllers/user_provider.dart';
import 'package:comics/screens/coinshop_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LockBd extends StatefulWidget {
  final String idBd;

  LockBd(this.idBd);

  @override
  _LockBdState createState() => _LockBdState();
}

class _LockBdState extends State<LockBd> {
  bool comment;

  @override
  void initState() {
    super.initState();
    setState(() {
      comment = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bdList = Provider.of<BdProvider>(context);
    final bd = bdList.listbd.firstWhere((bandeD) => bandeD.idBd == widget.idBd);
    final userList = Provider.of<UserProvider>(context);
    final user = userList.listUser.first;
    return Container(
      child: Column(
        children: [
          SizedBox(height: 25),
          Text(bd.titleBd),
          Text(
            bd.categorieBd,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  bd.prixBd + ' Coins',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  if (double.parse(bd.prixBd) > double.parse(user.pointUser)) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          children: [
                            Container(
                              padding: EdgeInsets.all(25),
                              child: Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child:
                                        Image.asset('assets/images/coin.png'),
                                  ),
                                  Text(
                                    'Vous devez avez avoir ${bd.prixBd} coins, pour cette Bd.',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        child: Text('Annuler'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ButtonStyle(
                                            foregroundColor:
                                                ButtonStyleButton.allOrNull(
                                                    Colors.black)),
                                      ),
                                      Spacer(),
                                      TextButton(
                                        child: Text('Obtenir des coins ?'),
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              CoinshopScreen.routeName);
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    print('buy');
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    color: Theme.of(context).errorColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.download_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          Divider(
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Resumé:',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  bd.resumeBd,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Commentaires'),
                    ],
                  ),
                  TextButton(
                    child: Row(
                      children: [
                        Text(
                          'Lâcher un commentaire',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Stack(
                            children: [
                              
                            ],
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
