import 'package:comics/models/bande_dessinees.dart';
import 'package:comics/models/bdLikes.dart';
import 'package:flutter/cupertino.dart';

class BdLikesProvider with ChangeNotifier {
  bool _isProcessing = true;

  List<BdLikes> _likeList = [];

  bool get isProcessing => _isProcessing;

  List<BdLikes> get listLikes {
    return [..._likeList];
  }

  BdLikes findById(String idBd) {
    return _likeList.firstWhere((element) => element.idBd == idBd);
  }

  setBdList(List<BdLikes> list) {
    _likeList = list;
    notifyListeners();
  }
}
