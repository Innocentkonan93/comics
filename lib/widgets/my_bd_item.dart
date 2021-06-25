import 'package:comics/controllers/Bd_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyBdItem extends StatefulWidget {
  @override
  _MyBdItemState createState() => _MyBdItemState();
}

class _MyBdItemState extends State<MyBdItem> {
  @override
  Widget build(BuildContext context) {
    final bdList = Provider.of<BdProvider>(context);

    final bd = bdList.listbd;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: bd.length,
      itemBuilder: (BuildContext context, int index) {
        final bandeD = bd[index];
        return Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(
                color: Colors.white,
                width: 0.4,
              ),
              image: DecorationImage(
                  image: NetworkImage(
                      'http://192.168.64.2/Projects/ncomic/bandedessinees/${bandeD.imageBd}'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.black38,
                child: Row(
                  children: [
                    Text(
                      bandeD.titleBd,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(1),
                            offset: Offset(0, 1),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
