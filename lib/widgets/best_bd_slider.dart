import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:comics/controllers/user_provider.dart';
import 'package:comics/screens/bd_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/Bd_provider.dart';

class BestBdSlider extends StatefulWidget {
  @override
  _BestBdSliderState createState() => _BestBdSliderState();
}

class _BestBdSliderState extends State<BestBdSlider> {
  int _currentIndex = 1;
  List<Color> color = [
    Colors.amber,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.blueAccent,
    Colors.redAccent
  ];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context).listUser.first;
    final bd = Provider.of<BdProvider>(context);
    final bdList = bd.listbd;
    final size = MediaQuery.of(context).size;
    return bdList == null
        ? Container()
        : CarouselSlider(
            options: CarouselOptions(
              height: 200,
              aspectRatio: 1,
              viewportFraction: 0.9,
              initialPage: _currentIndex,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 15),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
            items: bdList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        BdDetailScreen.routeName,
                        arguments: i.idBd,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(55),
                        borderRadius: BorderRadius.circular(5),
                        //  border: Border.all(width: 0.7, color: Colors.black12)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Card(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'http://192.168.64.2/Projects/ncomic/bandedessinees/${i.imageBd}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.bookmark,
                                    color: Colors.amber,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    i.titleBd,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        child: Text(
                                          i.prixBd == '0'
                                              ? 'FREE'
                                              : '\$${i.prixBd}',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        radius: 40,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Auteur:'),
                                      SizedBox(width: 5),
                                      Flexible(
                                        child: Text(
                                          i.nomAuteur,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/clap 2.png',
                                              height: 21,
                                              width: 21,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(i.likeCount),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.blue,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(i.viewCount),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
  }
}
