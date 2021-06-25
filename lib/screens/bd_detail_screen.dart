import 'package:comics/controllers/Bd_provider.dart';
import 'package:comics/controllers/bdLikes_provider.dart';
import 'package:comics/controllers/user_provider.dart';
import 'package:comics/services/api_helpers.dart';
import 'package:comics/widgets/lock_bd.dart';
import 'package:comics/widgets/unlock_bd.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class BdDetailScreen extends StatefulWidget {
  static const routeName = 'bd-screen/';

  @override
  _BdDetailScreenState createState() => _BdDetailScreenState();
}

class _BdDetailScreenState extends State<BdDetailScreen> {
  String _idBd;
  String _idUser;

  Future addLike() async {
    var response = await http.post(
        "http://192.168.64.2/Projects/ncomic/dataHandling/addLike.php",
        body: {
          'idBd': _idBd,
          'idUser': _idUser,
        });
    if (response.statusCode == 200) {
      // _getBds();
    }
  }

  Future addView() async {
    var response = await http
        .post("http://bad-event.com/ncomic/dataHandling/addView.php", body: {
      'idBd': _idBd,
      'idUser': _idUser,
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

  

  void _getBdLikes() async {
    var provider = Provider.of<BdLikesProvider>(context, listen: false);
    var response = await AllLikes.getAllLikes();
    if (response.isSuccesful) {
      provider.setBdList(response.data);
    }
  }

  @override
  void initState() {
    super.initState();
    _getBds();
    _getBdLikes();
  }

  @override
  Widget build(BuildContext context) {
    // id Bd
    final idBd = ModalRoute.of(context).settings.arguments as String;

    // fetch Bd by Id
    final bandeD =
        Provider.of<BdProvider>(context, listen: false).findById(idBd);

    // fetch User
    final users = Provider.of<UserProvider>(context);
    final user = users.listUser.first;

    final BdLikes = Provider.of<BdLikesProvider>(context)
        .listLikes
        .where((element) => element.idBd == idBd)
        .toList();
    // .where((element) => element.idUser == user.idUser)
    // .toList();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 260,
              // floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 12,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        bandeD.likeCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(
                              'http://192.168.64.2/Projects/ncomic/bandedessinees/${bandeD.imageBd}'),
                          child: Container(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(flex: 2, child: Container()),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.remove_red_eye,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    //BdLikes.length.toString(),
                                    bandeD.viewCount.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            Expanded(flex: 1, child: Container()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                InkWell(
                  onTap: () async {
                    // model.favoriteToggle();
                    // if (model.isFavorite == false) {
                    //   addLike();
                    // }

                    setState(() {
                      _idBd = bandeD.idBd;
                      _idUser = user.idUser;
                      print(_idUser);
                    });

                    if (BdLikes.isEmpty) await addLike();
                    _getBds();
                    print(BdLikes.toString());
                  },
                  child: Container(
                    child: Icon(
                      Icons.favorite_border_rounded,
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.info_outline), onPressed: () {})
              ],
            ),
          ];
        },
        body: bandeD.prixBd == '0' || bandeD.statutBd == 'buy'
            ? UnlockBd(idBd)
            : LockBd(idBd),
      ),
    );
  }
}
