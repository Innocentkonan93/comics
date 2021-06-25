import 'package:comics/models/categories.dart';
import 'package:flutter/cupertino.dart';


class CatProvider with ChangeNotifier {
  bool _isProcessing = true;
  List<Categories> _categoriesList = [];

  bool get isProcessing => _isProcessing;
  List<Categories> get categoriesList {
    return _categoriesList;
  }
  

  setIsProcessing(value) {
    _isProcessing = value;
    notifyListeners();
  }

  setCategoriesList(List<Categories> list) {
    _categoriesList = list;
    notifyListeners();
  }
}
