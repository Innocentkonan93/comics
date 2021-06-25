import 'package:comics/models/bande_dessinees.dart';
import 'package:comics/screens/bd_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForYouGridItem extends StatefulWidget {
  @override
  _ForYouGridItemState createState() => _ForYouGridItemState();
}

class _ForYouGridItemState extends State<ForYouGridItem> {
  @override
  Widget build(BuildContext context) {
    final bandeDessinees = Provider.of<BandeDessinees>(context);
    return Hero(
      tag: 'Bd-${bandeDessinees.idBd}',
      transitionOnUserGestures: true,
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    BdDetailScreen.routeName,
                    arguments: bandeDessinees.idBd,
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  //elevation: 7,
                  child: Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        'http://192.168.64.2/Projects/ncomic/bandedessinees/${bandeDessinees.imageBd}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            bandeDessinees.titleBd,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/clap 2.png',
                        height: 18,
                        width: 18,
                      ),
                      Text(
                        bandeDessinees.likeCount == null
                            ? "0"
                            : bandeDessinees.likeCount,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Container
          ],
        ),
      ),
    );
  }
}
