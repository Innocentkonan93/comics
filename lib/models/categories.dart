import 'package:flutter/cupertino.dart';

class Categories with ChangeNotifier {
  String idCategorie;
  String categories;
  Null categorieSlug;

  Categories({this.idCategorie, this.categories, this.categorieSlug});

  Categories.fromJson(Map<String, dynamic> json) {
    idCategorie = json['idCategorie'];
    categories = json['categories'];
    categorieSlug = json['categorieSlug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['idCategorie'] = this.idCategorie;
    data['categories'] = this.categories;
    data['categorieSlug'] = this.categorieSlug;
    return data;
  }
}
