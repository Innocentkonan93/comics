import 'package:comics/controllers/Bd_provider.dart';
import 'package:comics/services/api_helpers.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UnlockBd extends StatefulWidget {
  final String idBd;
  UnlockBd(this.idBd);
  @override
  _UnlockBdState createState() => _UnlockBdState();
}

class _UnlockBdState extends State<UnlockBd> {
  String idUser;

  Future addView() async {
    var response = await http
        .post("http://bad-event.com/ncomic/dataHandling/addView.php", body: {
      'idBd': widget.idBd,
      'idUser': idUser,
    });
    if (response.statusCode == 200) {
      _getBds();
    }
  }

  void _getBds() async {
    var provider = Provider.of<BdProvider>(context, listen: false);
    var response = await AllBandeDessinnees.getBandeDessinees();
    if (response.isSuccesful) {
      provider.setBdList(response.data);
    }
  }

  void getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String prefIdUser = prefs.getString('idUser');
    setState(() {
      idUser = prefIdUser;
    });
  }

  @override
  void initState() {
    _getBds();
    getUserId();
    Future.delayed(Duration(seconds: 3), () {
      addView();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bd = Provider.of<BdProvider>(context);
    final bandeDessinnees = bd.findById(widget.idBd);
    return Container(
      child: ListView.separated(
        itemBuilder: (ctx, i) => Container(
          child: GestureDetector(
            onTap: () {
              addView();
              print('xa');
            },
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.grey,
                  child: Text('$i'),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('# Episode ${i + 1}'),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (contxt, i) => Divider(height: 1),
        itemCount: 112,
      ),
    );
  }
}
