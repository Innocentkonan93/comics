import 'package:comics/connectivity/connectivity_provider.dart';
import 'package:comics/controllers/Bd_provider.dart';
import 'package:comics/controllers/cat_provider.dart';
import 'package:comics/services/api_helpers.dart';
import 'package:comics/widgets/slider_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'best_bd_slider.dart';
import 'categories_list.dart';
import 'for_you_grid.dart';
import 'new_bd_list.dart';

class HomeScreenList extends StatefulWidget {
  @override
  _HomeScreenListState createState() => _HomeScreenListState();
}

class _HomeScreenListState extends State<HomeScreenList> {
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
    super.initState();
    _getBds();
    _getCategories();
    Provider.of<ConnectivityProvider>(context, listen: false)
        .initConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: PageStorageKey('HomeSL'),
      children: [
        // Carousel
        SliderItem(),
        SizedBox(height: 20),
        //Categories
        Consumer<CatProvider>(
          builder: (context, catProvider, child) {
            return CatergoriesList();
          },
        ),
        SizedBox(height: 25),
        // nouveauté
        Consumer<BdProvider>(
          builder: (context, bdProvier, child) {
            return NewBdList();
          },
        ),
        SizedBox(height: 30),
        Consumer<BdProvider>(
          builder: (context, bdProvier, child) {
            return ForYouGrid();
          },
        ),
        SizedBox(height: 25),
        Consumer<BdProvider>(
          builder: (context, bdProvider, child) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              height: 400,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Meilleures séries',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  BestBdSlider(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
