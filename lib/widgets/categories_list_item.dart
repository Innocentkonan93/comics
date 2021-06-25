import 'package:comics/models/categories.dart';
import 'package:comics/screens/All_bd_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CategoriesListItem extends StatelessWidget {
  static const routeName = 'categories-item';
  // final Color colors;
  // CategoriesListItem(this.colors);

  @override
  Widget build(BuildContext context) {
    final cat = Provider.of<Categories>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => AllBdScreen(cat.idCategorie)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Colors.amber,
              Colors.white.withOpacity(0.7),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.centerRight,
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          cat.categories,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
