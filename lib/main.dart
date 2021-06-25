import 'package:comics/connectivity/connectivity_provider.dart';
import 'package:comics/controllers/Bd_provider.dart';
import 'package:comics/controllers/bdLikes_provider.dart';
import 'package:comics/controllers/user_provider.dart';
import 'package:comics/models/bande_dessinees.dart';
import 'package:comics/models/bdLikes.dart';
import 'package:comics/routes.dart';
import 'package:comics/screens/All_bd_screen.dart';
import 'package:comics/screens/bd_detail_screen.dart';
import 'package:comics/screens/coinshop_screen.dart';
import 'package:comics/screens/home_screen.dart';
import 'package:comics/screens/login_screen.dart';
import 'package:comics/screens/tab_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'controllers/cat_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BdProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CatProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BandeDessinees(),
        ),
        ChangeNotifierProvider(
          create: (_) => ConnectivityProvider(),
          child: HomeScreen(),
        ),
        ChangeNotifierProvider(
          create: (_) => BdLikesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'NComics',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginScreen());
        break;
      case AllBdScreen.routeName:
        return MaterialPageRoute(builder: (context) => AllBdScreen(null));
        break;
      case CoinshopScreen.routeName:
        return MaterialPageRoute(builder: (context) => CoinshopScreen());
        break;
      case UserTabScreen.routeName:
        return MaterialPageRoute(builder: (context) => UserTabScreen());
        break;
      case BdDetailScreen.routeName:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                BdDetailScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 0.1);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
        break;
      default:
        return null;
    }
  }
}
