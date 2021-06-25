import 'package:comics/connectivity/connectivity_provider.dart';
import 'package:comics/connectivity/no-internet.dart';
import 'package:comics/controllers/bdLikes_provider.dart';
import 'package:comics/controllers/cat_provider.dart';
import 'package:comics/services/api_helpers.dart';
import 'package:comics/widgets/home_screen_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/Bd_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _getBds() async {
    var provider = Provider.of<BdProvider>(context, listen: false);
    var response = await AllBandeDessinnees.getBandeDessinees();
    if (response.isSuccesful) {
      provider.setBdList(response.data);
    }
  }

  _getCategories() async {
    var provider = Provider.of<CatProvider>(context, listen: false);
    var resp = await AllCategories.getCategory();
    if (resp.isSuccesful) {
      provider.setCategoriesList(resp.data);
    }
  }

  _getBdLikes() async {
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
    _getCategories();
    _getBdLikes();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: HomeScreenList()

        // SafeArea(
        //   child: Consumer<ConnectivityProvider>(
        //     builder: (context, internet, child) {
        //       if (internet.isOnline != null) {
        //         print('Connected');
        //         return internet.isOnline ? HomeScreenList() : NoInternet();
        //       }
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     },
        //     child: HomeScreenList(),
        //   ),
        //  ),
        );
  }
}
