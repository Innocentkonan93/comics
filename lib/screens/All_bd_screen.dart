import 'package:comics/controllers/Bd_provider.dart';
import 'package:comics/controllers/cat_provider.dart';
import 'package:comics/services/api_helpers.dart';
import 'package:comics/widgets/all_bd_grid.dart';
import 'package:comics/widgets/categories/action.dart';
import 'package:comics/widgets/categories/comedie.dart';
import 'package:comics/widgets/categories/drame.dart';
import 'package:comics/widgets/categories/fanstatique.dart';
import 'package:comics/widgets/categories/romance.dart';
import 'package:comics/widgets/categories/super-hero.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AllBdScreen extends StatefulWidget {
  static const routeName = 'all-bd-screen';
  final String index;
  AllBdScreen(this.index);
  @override
  _AllBdScreenState createState() => _AllBdScreenState();
}

class _AllBdScreenState extends State<AllBdScreen>
    with SingleTickerProviderStateMixin {
  _getBds() async {
    var provider = Provider.of<BdProvider>(context, listen: false);
    var response = await AllBandeDessinnees.getBandeDessinees();
    if (response.isSuccesful) {
      provider.setBdList(response.data);
    }
  }

  _getCategories() async {
    var provider = Provider.of<CatProvider>(context, listen: false);
    var resp = await AllCategories.getCategory();
    if (resp.isSuccesful) {
      provider.setCategoriesList(resp.data);
    }
  }

  @override
  void initState() {
    _getBds();
    _getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: int.parse(widget.index == null ? '0' : widget.index),
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            'BD-thèque',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
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
                  'Action',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Comedie',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Drame',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Romance',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Super-Hero',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Fantastique',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ],
            isScrollable: true,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).accentColor,
                size: 25,
              ),
              onPressed: null,
            )
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: AllBdGrid(),
            ),
            SingleChildScrollView(
              child: ActionBdGrid(),
            ),
            SingleChildScrollView(
              child: ComedieBdGrid(),
            ),
            SingleChildScrollView(
              child: DrameBdGrid(),
            ),
            SingleChildScrollView(
              child: RomanceBdGrid(),
            ),
            SingleChildScrollView(
              child: SuperHeroBdGrid(),
            ),
            SingleChildScrollView(
              child: FantastiqueBdGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
