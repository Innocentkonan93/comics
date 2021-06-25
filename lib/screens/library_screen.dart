import 'package:comics/screens/favory_bd_screen.dart';
import 'package:comics/widgets/my_bd_item.dart';
import 'package:flutter/material.dart';

import 'purchased_bd_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key key}) : super(key: key);
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              'Mes Comics',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text(
                    'Tout',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'J\'aime',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Achetés',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MyBdItem(),
              FavoryBdScreen(),
              PurchaseBdScreen(),
            ],
          )),
    );
  }
}
