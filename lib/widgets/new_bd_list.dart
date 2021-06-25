import 'package:comics/controllers/Bd_provider.dart';
import 'package:comics/controllers/user_provider.dart';
import 'package:comics/widgets/more_item.dart';
import 'package:comics/widgets/newBd_list_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class NewBdList extends StatefulWidget {
  @override
  _NewBdListState createState() => _NewBdListState();
}

class _NewBdListState extends State<NewBdList> {
  @override
  Widget build(BuildContext context) {
    // final _height = MediaQuery.of(context).size.height;
    final bd = Provider.of<BdProvider>(context);
    final bdList = bd.listbd;
    // .where((bd) =>
    //     DateTime.parse(bd.creatAt) ==
    //     DateTime.parse(bd.creatAt).subtract(Duration(days: 7)))
    // .toList();
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 15),
      //color: Colors.grey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Nouveauté',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bdList.length + 1,
              itemBuilder: (ctx, i) {
                if (i == bdList.length) {
                  return MoreItem();
                }
                return ChangeNotifierProvider.value(
                  value: bdList[i],
                  child: NewBdListItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
