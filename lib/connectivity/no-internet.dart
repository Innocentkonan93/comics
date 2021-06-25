import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/no-internet.png'),
              )
            ),
          ),
          Text('Aucune connexion internet',
          textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 18
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Verifier si le Wifi est actif et que le mode avion est désativé',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 13
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text('Réessayer'))
            ],
          )
        ],
      ),
    );
  }
}
