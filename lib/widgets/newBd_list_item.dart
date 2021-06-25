import 'package:comics/controllers/user_provider.dart';
import 'package:comics/models/bande_dessinees.dart';
import 'package:comics/screens/bd_detail_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class NewBdListItem extends StatefulWidget {
  @override
  _NewBdListItemState createState() => _NewBdListItemState();
}

class _NewBdListItemState extends State<NewBdListItem> {
  @override
  Widget build(BuildContext context) {
    final bd = Provider.of<BandeDessinees>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          BdDetailScreen.routeName,
          arguments: bd.idBd,
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'http://192.168.64.2/Projects/ncomic/bandedessinees/${bd.imageBd}'),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(
                        1,
                        1,
                      ),
                      blurRadius: 2,
                      spreadRadius: 1,
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    bd.categorieBd,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bd.titleBd,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
