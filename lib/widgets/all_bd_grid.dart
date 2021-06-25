import 'dart:ui';

import 'package:comics/controllers/Bd_provider.dart';
import 'package:comics/widgets/bd_item.dart';
import 'package:flutter/material.dart';
 
import 'package:provider/provider.dart';

class AllBdGrid extends StatefulWidget {
  @override
  _AllBdGridState createState() => _AllBdGridState();
}

class _AllBdGridState extends State<AllBdGrid> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final bd = Provider.of<BdProvider>(context);
    final bdList = bd.listbd;
    return Center(
      child: Container(
        height: _height,
        // color: Colors.blue[50],
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 2.75,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 20,
                ),
                itemCount: bdList.length,
                itemBuilder: (ctx, i) {
                  return ChangeNotifierProvider.value(
                    value: bdList[i],
                    child: bdList.isEmpty ? Center() : BdItem(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
