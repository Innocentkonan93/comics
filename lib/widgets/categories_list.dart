import 'package:comics/controllers/cat_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'categories_list_item.dart';

class CatergoriesList extends StatefulWidget {
  @override
  _CatergoriesListState createState() => _CatergoriesListState();
}

class _CatergoriesListState extends State<CatergoriesList> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final categories = Provider.of<CatProvider>(context);
    final categoriesList = categories.categoriesList;
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: categoriesList[i],
                child: CategoriesListItem(),
              ),
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
