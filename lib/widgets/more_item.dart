import 'package:comics/screens/All_bd_screen.dart';
import 'package:flutter/material.dart';


class MoreItem extends StatefulWidget {
  @override
  _MoreItemState createState() => _MoreItemState();
}

class _MoreItemState extends State<MoreItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AllBdScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  // color: Colors.amber.withOpacity(0.4),
                  //borderRadius: BorderRadius.circular(8),
                  // border: Border.all(color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(5),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.1),
                  //     offset: Offset(
                  //       1,
                  //       1,
                  //     ),
                  //     blurRadius: 2,
                  //     spreadRadius: 1,
                  //   )
                  // ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.add_circle_outline_rounded),
                    Text(
                      'Voir plus',
                      style: TextStyle(color: Colors.blue.shade200),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
