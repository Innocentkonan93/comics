import 'package:comics/models/bande_dessinees.dart';
import 'package:flutter/cupertino.dart';

class BdProvider with ChangeNotifier {
  bool _isProcessing = true;

  List<BandeDessinees> _listBd = [];

  bool get isProcessing => _isProcessing;

  List<BandeDessinees> get listbd {
    return [..._listBd];
  }

  BandeDessinees findById(String id) {
    return _listBd.firstWhere((element) => element.idBd == id);
  }

  setBdList(List<BandeDessinees> list) {
    _listBd = list;
    notifyListeners();
  }
}
