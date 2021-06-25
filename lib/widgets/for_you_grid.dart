import 'dart:ui';

import 'package:comics/controllers/Bd_provider.dart';
import 'package:comics/screens/All_bd_screen.dart';
import 'package:comics/widgets/for_you_grid_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ForYouGrid extends StatefulWidget {
  @override
  _ForYouGridState createState() => _ForYouGridState();
}

class _ForYouGridState extends State<ForYouGrid> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final bd = Provider.of<BdProvider>(context);
    final bdList = bd.listbd;
    return Container(
      height: 365,
      // color: Colors.amber[50],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pour Vous',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AllBdScreen.routeName);
                    },
                    child: Icon(
                      Icons.read_more_rounded,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(18.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: bdList.length,
              itemBuilder: (ctx, i) {
                return ChangeNotifierProvider.value(
                  value: bdList[i],
                  child: ForYouGridItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
