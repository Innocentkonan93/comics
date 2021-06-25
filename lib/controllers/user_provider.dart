import 'package:comics/models/users.dart';
import 'package:flutter/material.dart';


class UserProvider with ChangeNotifier {
  bool _isProcessing = true;

  List<Users> _listUser = [];

  bool get isProcessing => _isProcessing;

  List<Users> get listUser {
    return [..._listUser];
  }

  setUserList(List<Users> list) {
    _listUser = list;
    notifyListeners();
  }
}
